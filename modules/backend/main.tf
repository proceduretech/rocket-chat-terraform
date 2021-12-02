# ------------------------------------------------------------------------------
# S3 BUCKET - LOGGING BUCKET
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "terraform_state_logs_bucket" {
  bucket = "${var.state_storage_bucket}-logs"
  acl    = "log-delivery-write"

  versioning {
    enabled = true
  }

  tags = {
    purpose = "Logging bucket for ${var.state_storage_bucket}"
  }

}


# ------------------------------------------------------------------------------
# DYNAMODB TABLE - STATE LOCKING AND CONSISTENCY
# ------------------------------------------------------------------------------
resource "aws_dynamodb_table" "terraform_state_locks" {
  name         = "${var.state_storage_bucket}-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


# ------------------------------------------------------------------------------
# S3 BUCKET - TO STORE TERRAFORM STATE
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "terraform_state_storage" {
  bucket = var.state_storage_bucket
  acl    = "private"

  # Enable versioning to view full revision history of state files
  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.terraform_state_logs_bucket.id
    target_prefix = "log/"
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

}
