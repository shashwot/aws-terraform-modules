# Initialize
variable "access_key" {
  description = "Access Key"
  type        = string
}
variable "secret_key" {
  description = "Secret Key"
  type        = string
}
variable "aws_region" {
  description = "Region"
  type        = string
}

# VPC
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "demo-vpc"
}

variable "vpc_block" {
  description = "VPC Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-west-2a","us-west-2b"]
}

variable "public_subnets" {
  description = "Public Subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "private_subnets" {
  description = "Private Subnets"
  type        = list(string)
  default     = ["10.0.110.0/24", "10.0.120.0/24"]
}


# RDS
variable "cluster_identifier" {
  description   = "ID of cluster"
  default = "testdb"
}

variable "availability_zones" {
    description = "Availability Zones"
    type = list(string)
    default = ["us-west-2a", "us-west-2b"]
}

variable "database_name" {
    description = "Database Name"
    type = string
    default = "demodb"
}

variable "master_username" {
    description = "Master Username"
    type = string
}

variable "master_password" {
    description = "Master Password"
    type = string
}

variable "engine" {
    description = "Engine"
    type = string
    default = "aurora-postgresql"
}

variable "engine_version" {
    description = "Engine Version"
    type = string
    default = "13.3"
}

variable "backup_retention_period" {
    description = "Backup Retention Period"
    type = number
    default = 7
}

variable "skip_final_snapshot" {
    description = "Skip final Snapshot"
    type = bool
    default = true
}

variable "apply_immediately" {
    description = "Apply Immediately"
    type = bool
    default = true
}

variable "deletion_protection" {
    description = "Delete Protection"
    type = bool
    default = true
}

variable "db_count" {
    description = "DB Instances"
    type = number
    default = 2
}

variable "instance_class" {
    description = "Instance Class"
    type = string
    default = "db.t3.medium"
}

variable "publicly_accessible" {
    description = "Publicly Accessible"
    type = bool
    default = false
}

variable "performance_insights_enabled" {
    description = "Performance Insight Enable"
    type = bool
    default = true
}


# S3
variable "bucket_name" {
  type = list(string)
}
variable "versioning" {
  description = "Versioning"
  type = string
  default = "Disabled"
}
variable "acl_type" {
  description = "Acl Type"
  type = string
  default = "public-read"
}
variable "block_public_acls" {
  description = "Block Public Acl"
  type = bool
  default = true
}
variable "block_public_policy" {
  description = "Block Public Policy"
  type = bool
  default = true
}
variable "ignore_public_acls" {
  description = "Ignore Public ACL"
  type = bool
  default = true
}
variable "restrict_public_buckets" {
  description = "Restrict Public Buckets"
  type = bool
  default = true
}
variable "kms_encryption_enabled" {
  description = "KMS Encryption"
  type = bool
  default = true
}



# ECR
variable "ecr_repo" {
    description = "ECR Repository"
    type = list(string)
}


# Security Groups
variable "eks_security_group_name" {
  description = "Security Group Name"
  type        = string
  default     = "eks-sg"
}

variable "eks_sg_description" {
  description = "Security Group Description"
  type        = string
  default     = "EKS Security Group"
}

variable "eks_ingress_rules" {
  type    = list(map(string))
  description = "A list of ingress rules for the security group"
  default = []
}

variable "eks_egress_rules" {
  type    = list(map(string))
  description = "A list of egress rules for the security group"
  default = []
}

# EKS

variable "eks_cluster_name" {
  description = "Eks Cluster Name"
  type        = string
  default     = "demo-eks-cluster"
}

variable "eks_cluster_version" {
  description = "Eks Cluster Version"
  type        = string
  default     = "1.21"
}


# EKS Node Group
variable "eks_node_group_name" {
  description = "Node Group Name"
  type        = string
  default     = "demo-eks-node-group"
}
variable "node_group_instance_types" {
  description = "Node group instance types"
  type        = list(string)
  default     = ["t3.large"]
}
variable "node_group_name" {
  description = "Node Group Name"
  type        = string
  default     = "eks-ng-large"
}
variable "node_group_disk_size" {
  description = "Node Group Disk Size"
  type        = string
  default     = "100"
}
variable "node_desired_size" {
  description = "Node Desired Size"
  type        = number
  default     = 1
}
variable "node_max_size" {
  description = "Node Max Size"
  type        = number
  default     = 3
}
variable "node_min_size" {
  description = "Node Min Size"
  type        = number
  default     = 1
}
