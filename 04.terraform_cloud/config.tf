terraform {
  required_providers {
    oci = {
      version = ">= 4.90"
      source  = "oracle/oci"
    }
  }
#####
  cloud {
    organization = "" # <<<<<

    workspaces {
      name = "" # <<<<<
    }
  }
#####
}

variable "private_key" {
  default = ""
}

provider "oci" {
  region = "eu-frankfurt-1"
  private_key = var.private_key

}