mkdir .certificates &&
	touch .certificates/private.key &&
	touch .certificates/certificate.pem &&
	echo $PSD2_PRIVATE_KEY | base64 --decode >.certificates/private.key &&
	echo $PSD2_CERTIFICATE | base64 --decode >.certificates/certificate.pem
