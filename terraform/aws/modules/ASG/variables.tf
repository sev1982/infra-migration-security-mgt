variable "env" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "instances_sg_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "desired_capacity" {
  type = number
  default = 2
}

variable "min_size" {
  type = number
  default = 2
}

variable "max_size" {
  type = number
  default = 4
}

variable "alb_target_group_arn" {
  type = string
}
