############################
# PROVIDER & DATA
############################
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      Service     = "TrailAlerts"
      ManagedBy   = "Terraform"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  #backend "s3" {
  #  bucket  = "trailalerts-terraform-state-123123123123" # Change this to your S3 bucket name
  #  key     = "terraform.tfstate"
  #  region  = "us-east-1"
  #  encrypt = true
  #}
}

module "trailalerts" {
  source  = "adanalvarez/trailalerts/aws"
  version = "0.2.1"

  aws_region                      = var.aws_region
  environment                     = var.environment
  email_endpoint                  = var.email_endpoint
  create_cloudtrail               = var.create_cloudtrail
  existing_cloudtrail_bucket_name = var.existing_cloudtrail_bucket_name
  enable_sns                      = var.enable_sns
  ses_identities                  = var.ses_identities
  source_email                    = var.source_email
  vpnapi_key                      = var.vpnapi_key
  correlation_enabled             = var.correlation_enabled
  cloudwatch_logs_retention_days  = var.cloudwatch_logs_retention_days
  notification_cooldown_minutes   = var.notification_cooldown_minutes
  min_notification_severity       = var.min_notification_severity
  project                         = var.project
}