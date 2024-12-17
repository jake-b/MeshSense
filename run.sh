docker run -d --name meshsense \
	-p 5920:5920 -p 5921:5921 \
	-e ACCESS_KEY="mySecretKey" \
	--restart unless-stopped \
	--privileged \ 
	meshsense