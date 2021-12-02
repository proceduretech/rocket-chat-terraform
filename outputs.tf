output "bucket" {
  value = module.backend.s3_backend_bucket_name
}

output "dynamodb_table" {
  value = module.backend.dynamodb_lock_table_name
}

output "encrypt" {
  value = "true"
}

output "key" {
  value = "terraform.tfstate"
}

output "region" {
  value = var.aws_region
}