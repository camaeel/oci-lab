terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    key    = "oci-lab/oci-lab.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
  
  required_providers {
    oci = {
      source = "hashicorp/oci"
      version = ">= 4.52.0"
    }
  }
}

provider "oci" {
  # Configuration options
}
