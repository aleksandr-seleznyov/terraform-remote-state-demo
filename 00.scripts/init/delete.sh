#!/bin/bash

source ../../oci-connection/vars_init.env
PAR_ID=$(oci os preauth-request list -bn state_script |jq -r '.data[0].id')
oci os object bulk-delete -bn state_script
oci os preauth-request delete -bn state_script --par-id ${PAR_ID}
oci os bucket delete --name state_script
