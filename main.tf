# VPC
module "vpc" {
    source                          = "./modules/vpc"
    vpc_name                        = var.vpc_name
    vpc_block                       = var.vpc_block
    azs                             = var.azs
    public_subnets                  = var.public_subnets
    private_subnets                 = var.private_subnets
}


# SECURITY GROUPS
module "security_group_eks" {
    source                          = "./modules/security-groups"
    security_group_name             = var.eks_security_group_name
    sg_description                  = var.eks_sg_description
    vpc_id                          = module.vpc.vpc_id
    ingress_rules                   = var.eks_ingress_rules
    egress_rules                    = var.eks_egress_rules 
}


# EKS CLuster
module "eks" {
    source                          = "./modules/eks-cluster"
    eks_cluster_name                = var.eks_cluster_name
    eks_cluster_version             = var.eks_cluster_version
    subnet_ids                      = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
    
    depends_on = [
        module.vpc
    ]
}


# EKS Node Groups
module "node_group_1" {
    source                          = "./modules/eks-nodegroup"
    subnet_ids                      = module.vpc.private_subnet_ids
    eks_node_group_name             = var.eks_node_group_name
    node_group_instance_types       = var.node_group_instance_types
    node_group_name                 = var.node_group_name
    node_group_disk_size            = var.node_group_disk_size
    node_desired_size               = var.node_desired_size
    node_max_size                   = var.node_max_size
    node_min_size                   = var.node_min_size

    depends_on = [
        module.vpc,
        module.eks
    ]
}

# RDS
module "rds" {
    source                          = "./modules/rds"
    db_count                        = var.db_count
    private_subnet_groups           = module.vpc.private_subnet_ids
    availability_zones              = var.azs
    cluster_identifier              = var.cluster_identifier
    engine                          = var.engine
    engine_version                  = var.engine_version
    instance_class                  = var.instance_class
    database_name                   = var.database_name
    master_username                 = var.master_username
    master_password                 = var.master_password
    backup_retention_period         = var.backup_retention_period 
    skip_final_snapshot             = var.skip_final_snapshot
    deletion_protection             = var.deletion_protection
    performance_insights_enabled    = var.performance_insights_enabled
    apply_immediately               = var.apply_immediately
    publicly_accessible             = var.publicly_accessible 
    
    depends_on = [
        module.vpc
    ]
}

# S3
module "s3" {
    source                          = "./modules/s3"
    bucket_name                     = var.bucket_name
    versioning                      = var.versioning            # Enabled / Disabled
    acl_type                        = var.acl_type              # public-read / private
    block_public_acls               = var.block_public_acls
    block_public_policy             = var.block_public_policy
    ignore_public_acls              = var.ignore_public_acls
    restrict_public_buckets         = var.restrict_public_buckets
}

# ECR
module "ecr" {
    source                          = "./modules/ecr"
    ecr_repo                        = var.ecr_repo
}


