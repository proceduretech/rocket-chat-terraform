locals {
  aws_default_tags = {
    environment        = var.environment,
    project            = var.project,
    application        = "Self-Managed Rocket.Chat Platform",
    managedByTerraform = "True",
  }
}

locals {
  default_state_storage_bucket = "${var.environment}-${var.project}-rocketchat-tfstate"
}

locals {
  state_storage_bucket = var.state_storage_bucket != "" ? var.state_storage_bucket : local.default_state_storage_bucket
}
