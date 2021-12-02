#!/usr/bin/env bash

# Step 1: Download modules
terraform get -update

# Step 2: Initialize your directory/project for use with terraform
# The use of -backend=false here is important: it avoids backend configuration
# on our first call to init since we havent created our backend resources yet
terraform init -backend=false

# Step 3: Create infrastructure plan for just the tf backend resources
# Target only the resources needed for our aws backend for terraform state/locking
terraform plan -var-file=terraform.tfvars -out=backend.tfplan -target=module.backend

# Step 4: Apply the infrastructure plan
terraform apply backend.tfplan

# Step 5: Write the backend configuration to the backend config file
terraform output > backend.tfvars

# Step 6: Write the backend block to the backend.tf
cat << EOF > backend.tf
terraform {
  backend "s3" {}
}
EOF

# Step 7: Reinitialize terraform to use your newly provisioned backend
terraform init -reconfigure -backend-config=backend.tfvars