variable "location" {
  type        = string
  default     = "East US"
  description = "Target deployment region"
}

variable "project_name" {
  type        = string
  default     = "devops-assignment"
  description = "Prefix identifier for app uniqueness"
}