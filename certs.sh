#!/bin/bash
mkdir .certificates &&
	touch .certificates/private.key &&
	touch .certificates/certificate.pem &&
	echo $PSD2_PRIVATE_KEY | base64 -d >.certificates/private.key &&
	echo $PSD2_CERTIFICATE | base64 -d >.certificates/certificate.pem
