variable "location" {
  type        = string
  default     = "Central India"
}

variable "project_name" {
  type        = string
  description = "Unique project workspace identifier"
}

variable "scenario_suffix" {
  type        = string
  description = "Appended to avoid cross-scenario resource blocks (e.g., s1, s2, s3)"
}