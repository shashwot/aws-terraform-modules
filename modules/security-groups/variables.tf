variable "security_group_name" {
  description = "Security Group Name"
  type        = string
  default     = "eks-sg"
}

variable "sg_description" {
  description = "Security Group Description"
  type        = string
  default     = "EKS Security Group"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
  default     = "vpc_id"
}

variable "ingress_rules" {
  type    = list(map(string))
  description = "A list of ingress rules for the security group"
  default = []
}

variable "egress_rules" {
  type    = list(map(string))
  description = "A list of egress rules for the security group"
  default = []
}