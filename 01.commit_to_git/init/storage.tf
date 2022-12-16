resource "oci_objectstorage_bucket" "this" {

  compartment_id = "" # <<<<<
  name           = "tf_storage_state_in_git"
  namespace = "" # <<<<<
}

resource "oci_objectstorage_preauthrequest" "this" {
  access_type  = "AnyObjectReadWrite"
  bucket       = oci_objectstorage_bucket.this.name
  name         = "terraform"
  namespace    = "" # <<<<<
  time_expires = "2022-12-31T12:19:00+00:00"
}

output "backend_url" {
  value = "https://objectstorage.eu-frankfurt-1.oraclecloud.com${oci_objectstorage_preauthrequest.this.access_uri}infra.tfstate"
}