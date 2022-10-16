####################################################
####TERRAFORM CONFIG
####################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}
###############################################
## PROVIDERS
##############################################

provider "aws" {
  region = var.aws_region
}


