docker run -t -i \
	-e "DOMAIN=example.com" \
	-e "DOMAINPASS=pass@word1" \
	-e "HOSTIP=127.0.0.1" \
    -e "INSECURELDAP=true" \
	-p 389:389 \
	-p 636:636 \
	--dns-search example.com \
	--add-host dc1.example.com:127.0.0.1 \
	-h dc1 \
	--privileged \
	dockerdc /bin/bash
