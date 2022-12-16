#!/bin/bash

source ../../oci-connection/vars_init.env
compertmentID='' # <<<<
oci os bucket create --name state_script --compartment-id ${compertmentID}
oci os preauth-request create --access-type "AnyObjectReadWrite" --name "tf_access" -bn state_script --time-expires "2022-12-31T12:19:00+00:00" | tee 1.json
echo "Endpoint URL:"
echo "https://objectstorage.eu-frankfurt-1.oraclecloud.com$(cat 1.json |jq -r '.data."access-uri"')infra.tfstate"
rm -rf 1.json