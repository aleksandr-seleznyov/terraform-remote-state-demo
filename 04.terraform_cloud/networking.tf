resource "oci_identity_compartment" "tf-compartment" {
  description = "Compartment for meetup-demo resources."
  name        = "demo-compartment"
}

locals {
  vcn_cidr_block                = "10.10.0.0/16"
}

resource "oci_core_vcn" "main" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  cidr_block     = local.vcn_cidr_block
  display_name   = "Main VCN"
  dns_label = "local"
}