terraform {
  required_providers {
    oci = {
      version = ">= 4.90"
      source  = "oracle/oci"
    }
  }
  ####
  backend "http" {
    update_method = "PUT"
    address       = "" # <<<< # backend_url_infrastructure_storage
  }
  ####
}
variable "private_key" {
  default = ""
}

provider "oci" {
  region = "eu-frankfurt-1"
  private_key = var.private_key

}