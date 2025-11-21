variable "env" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "cidr_block" {
  description = "Main CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
}
