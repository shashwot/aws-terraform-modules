variable "eks_cluster_name" {
  description = "Cluster Name"
  type        = string
  default     = "demo-eks-cluster"
}
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
variable "subnet_ids" {
  type    = list(string)
  description = "The IDs of the subnets where the EKS cluster will be deployed"
}
variable "node_group_name" {
  description = "Node Group Name"
  type        = string
  default     = "demo-eks-ng-large"
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
