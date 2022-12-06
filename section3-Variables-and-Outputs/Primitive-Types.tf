variable "aws_secret_key" {
  type        = string
  description = "aws secret key"
  sensitive   = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enable dns hostname"
  default     = true
}

variable "volume_size" {
  type        = number
  description = "volume size in gibibytes"
  default     = 10
}
