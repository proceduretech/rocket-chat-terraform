output "s3_backend_bucket_name" {
  value = aws_s3_bucket.terraform_state_storage.id
}

output "dynamodb_lock_table_name" {
  value = aws_dynamodb_table.terraform_state_locks.id
}
