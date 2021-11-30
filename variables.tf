# ------------------------------------------------------------------------------
# Project Variables
# ------------------------------------------------------------------------------
variable "environment" {
  type        = string
  default     = "production"
  description = "This is the Environment name for the resources."
}

variable "project" {
  type        = string
  description = "This is the Project name for which the resources are used."
}

variable "owner" {
  type        = string
  description = "Identify who is responsible for the resources."
}


# ------------------------------------------------------------------------------
# AWS Provider Variables
# ------------------------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "This is the AWS Region used for creating the Resources."
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "This is the AWS profile name as set in the AWS Shared Credentials file."
}

variable "aws_shared_credentials_file" {
  type        = string
  description = "This is the path to the AWS shared credentials file."
}

variable "additonal_aws_default_tags" {
  type        = map(string)
  default     = {}
  description = "Key-Value map of tags to apply across all resources handled by AWS provider."
}