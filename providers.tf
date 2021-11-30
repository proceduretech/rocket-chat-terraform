provider "aws" {
  region                  = var.aws_region
  profile                 = var.aws_profile
  shared_credentials_file = var.aws_shared_credentials_file

  default_tags {
    tags = merge(local.aws_default_tags, var.additonal_aws_default_tags)
  }

}
