#!/bin/bash

# Configure the GUI RPC
echo $BOINC_GUI_RPC_PASSWORD > /var/lib/boinc/gui_rpc_auth.cfg
echo $BOINC_REMOTE_HOST > /var/lib/boinc/remote_hosts.cfg

# Run BOINC. Full path needed for GPU support.
# Run this in the background so the script can continue
/usr/bin/boinc --attach_project $BOINC_PROJECT_URL $BOINC_AUTH_KEY

