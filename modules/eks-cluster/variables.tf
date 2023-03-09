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

variable "subnet_ids" {
  type    = list(string)
  description = "The IDs of the subnets where the EKS cluster will be deployed"
}