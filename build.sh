#!/bin/bash

PFSENSE_URL=https://frafiles.pfsense.org/mirror/downloads/pfSense-CE-2.4.5-RELEASE-p1-amd64.iso.gz
PFSENSE_ISO=pfSense-CE-2.4.5-RELEASE-p1-amd64.iso

if test -f "$PFSENSE_ISO"; then
	echo "$PFSENSE_ISO exists."
else
	echo "Downloading $PFSENSE_ISO..."
	curl --insecure -OL https://frafiles.pfsense.org/mirror/downloads/pfSense-CE-2.4.5-RELEASE-p1-amd64.iso.gz
	echo "(G)Unzipping $PFSENSE_ISO..."
	gunzip $PFSENSE_ISO.gz
fi

PACKER_LOG=1 packer build -on-error=ask pfsense-vmware.json

