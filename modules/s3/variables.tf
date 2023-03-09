variable "bucket_name" {
  type = list(string)
}

variable "versioning" {
  description = "Versioning"
  type        = string
  default     = "Enabled"
}

variable "block_public_acls" {
  description = "Block Public Acl"
  type        = bool
  default     = true
}
variable "block_public_policy" {
  description = "Block Public Policy"
  type        = bool
  default     = true
}
variable "ignore_public_acls" {
  description = "Ignore Public Acl"
  type        = bool
  default     = true
}
variable "restrict_public_buckets" {
  description = "Restrict Public Bucket"
  type        = bool
  default     = true
}

variable "acl_type" {
  description = "ACL Type"
  type        = string
  default     = "private"
}

variable "kms_encryption_enabled" {
  description = "KMS Encryption Type"
  type        = bool
  default     = true
}
