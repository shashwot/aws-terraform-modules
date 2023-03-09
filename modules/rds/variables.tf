variable "private_subnet_groups" {
  description   = "ID of main subnet"
}

variable "cluster_identifier" {
  description   = "ID of cluster"
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

