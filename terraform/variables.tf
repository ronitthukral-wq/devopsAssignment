variable "location" {
  type        = string
  default     = "East US"
  description = "Target deployment region"
}

variable "project_name" {
  type        = string
  default     = "findbetter-practice"
  description = "Prefix identifier for app uniqueness"
}