locals {
  aws_default_tags = {
    environment        = var.environment,
    project            = var.project,
    application        = "Self-Managed Rocket.Chat Platform",
    managedByTerraform = "True",
  }
}