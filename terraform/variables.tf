variable "location" {
  type        = string
  default     = "West US"
  description = "Target deployment region"
}

variable "project_name" {
  type        = string
  default     = "devops-assignment"
  description = "Prefix identifier for app uniqueness"
}