terraform {
  required_providers {
    oci = {
      version = ">= 4.90"
      source  = "oracle/oci"
    }
  }
  #### UNCOMMENT AFTER INITIAL CREATION
#  backend "http" {
#    update_method = "PUT"
#    address       = "" # <<<<
#  }
  ####

}

variable "private_key" {
  default = ""
}

provider "oci" {
  region = "eu-frankfurt-1"
  private_key = var.private_key
}