access_key = "xxx"
secret_key = "xxx"
aws_region = "us-west-2"


# VPC
vpc_name = "demo-vpc"
vpc_block = "10.0.0.0/16"
azs = ["us-west-2a","us-west-2b","us-west-2c"]
public_subnets = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
private_subnets = ["10.0.100.0/24", "10.0.110.0/24", "10.0.130.0/24"]


# EKS Cluster
eks_cluster_name = "demo-eks-cluster-1"
eks_cluster_version = "1.24"


# EKS Node_Group
eks_node_group_name = "demo-eks-nodegroup"
node_group_instance_types = ["t3.large"]
node_group_name = "demo-eks-ng-large"
node_group_disk_size = "100"
node_desired_size = 1
node_min_size = 1
node_max_size = 3


# RDS
db_count = 2
cluster_identifier = "testdb"
database_name = "weatherdb"
instance_class = "db.t3.medium"
engine = "aurora-postgresql"
engine_version = "13.3"
master_username = "MasterUs3rN@m2"
master_password = "MasterP@ssw0rD"
backup_retention_period = 7
skip_final_snapshot = true
apply_immediately = true
delete_protection = true
publicly_accessible = false
performance_insights_enabled = true


# S3
bucket_name = ["test-bucket", "test-bucket-2"]
versioning = "Disabled"           # Enabled / Disabled
acl_type = "public-read"          # public-read / private
kms_encryption_enabled = true
block_public_acls = true
block_public_policy = true
ignore_public_acls = true
restrict_public_buckets = true


# ECR
ecr_repo = ["test-ecr-repo1", "test-ecr-repo2"]


# SG FOR EKS
eks_security_group_name = "eks-sg"
eks_sg_description = "Security group for EKS"
eks_ingress_rules = [
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidr_block = "0.0.0.0/0"
    }
]
eks_egress_rules = [
    {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_block = "0.0.0.0/0"
    }
]


###
