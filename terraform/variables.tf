variable "location" {
  type        = string
  default     = "Central India"
  description = "Target deployment region"
}

variable "project_name" {
  type        = string
  default     = "devops-assignment"
  description = "Prefix identifier for app uniqueness"
}

variable "scenario" {
  type        = string
  default     = "s1"
  description = "Scenario identifier to keep resources unique"
}