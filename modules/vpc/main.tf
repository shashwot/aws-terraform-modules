# CREATE EKS VPC

resource "aws_vpc" "vpc" {
    cidr_block              = var.vpc_block
    tags = {
        Name                = "${var.vpc_name}"
    }
}

data "aws_vpc" "existing_vpc" {
    #"query existing resources"
    id                      = aws_vpc.vpc.id
}


# CREATE Public SUBNET

resource "aws_subnet" "public_subnets" {
    count                   = length(var.public_subnets)

    vpc_id                  = data.aws_vpc.existing_vpc.id
    map_public_ip_on_launch = var.map_public_ip_on_launch

    cidr_block              = element(var.public_subnets,count.index)
    availability_zone       = element(var.azs, count.index)
    
    tags = {
      Name                  = "public-subnet-${count.index}"
    }
}

# CREATE Private SUBNET

resource "aws_subnet" "private_subnets" {
    count                   = length(var.private_subnets)

    vpc_id                  = data.aws_vpc.existing_vpc.id

    cidr_block              = element(var.private_subnets,count.index)
    availability_zone       = element(var.azs, count.index)
    
    tags = {
      Name                  = "private-subnet-${count.index}"
    }
}

resource "aws_internet_gateway" "gw" {
  vpc_id                    = data.aws_vpc.existing_vpc.id
  tags = {
    Name                    = "${var.vpc_name}-internet-gateway"
  }
}

resource "aws_eip" "eip" {
  vpc                       = true
  depends_on                = [aws_internet_gateway.gw]
}


resource "aws_nat_gateway" "natgw" {
  
  allocation_id             = aws_eip.eip.id

  subnet_id                 = aws_subnet.public_subnets[0].id

  depends_on                = [aws_internet_gateway.gw]
  
  tags = {
    Name                    = "${var.vpc_name}-nat-gateway"
  }
}


# CREATE AND ASSIGN ROUTE TABLES

resource "aws_route_table" "route-table-public" {
  vpc_id                    = data.aws_vpc.existing_vpc.id
  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.gw.id
  }
  tags = {
    Name                    = "${var.vpc_name}-rt-public"
  }
}

resource "aws_route_table" "route-table-private" {
  vpc_id = data.aws_vpc.existing_vpc.id
  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = aws_nat_gateway.natgw.id
  }
  tags = {
    Name                    = "${var.vpc_name}-rt-private"
  }
}


resource "aws_route_table_association" "route-table-public-association" {
  count                     = length(var.public_subnets)
  
  subnet_id                 = element(aws_subnet.public_subnets[*].id, count.index)
  
  route_table_id            = element(aws_route_table.route-table-public[*].id,count.index)
}

resource "aws_route_table_association" "route-table-private-association" {
  count                     = length(var.private_subnets)
  
  subnet_id                 = element(aws_subnet.private_subnets[*].id, count.index)
  
  route_table_id            = element(aws_route_table.route-table-private[*].id,count.index)
}



