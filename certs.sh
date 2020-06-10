#!/bin/bash
mkdir -p .certificates &&
	touch .certificates/private.key &&
	touch .certificates/certificate.pem &&
	echo -n "$PSD2_PRIVATE_KEY" | openssl base64 -d >.certificates/private.key &&
	echo -n "$PSD2_CERTIFICATE" | openssl base64 -d >.certificates/certificate.pem
