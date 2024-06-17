variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instanceName" {
  description = "EC2 instance name"
  type        = string
  default     = "my_ec2_instance"
}

variable "instanceType" {
  description = "EC2 instances used"
  type        = string
  default     = "t2.small"
}