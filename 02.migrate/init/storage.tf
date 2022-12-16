resource "oci_objectstorage_bucket" "this" {

  compartment_id = "" # <<<<<
  name           = "tf_storage_state_migrate"
  namespace = "" # <<<<<
}

resource "oci_objectstorage_preauthrequest" "this" {
  access_type  = "AnyObjectReadWrite"
  bucket       = oci_objectstorage_bucket.this.name
  name         = "terraform"
  namespace    = "" # <<<<<
  time_expires = "2022-12-31T12:19:00+00:00"
}

output "backend_url_state_storage" {
  value = "https://objectstorage.eu-frankfurt-1.oraclecloud.com${oci_objectstorage_preauthrequest.this.access_uri}state.tfstate"
}

output "backend_url_infrastructure_storage" {
  value = "https://objectstorage.eu-frankfurt-1.oraclecloud.com${oci_objectstorage_preauthrequest.this.access_uri}infra.tfstate"
}