variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security Group for ALB"
  type        = string
}

variable "port" {
  description = "Listener port"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "tg_port" {
  description = "Target group port"
  type        = number
  default     = 80
}

variable "target_type" {
  description = "Target type for TG"
  type        = string
  default     = "instance"
}
