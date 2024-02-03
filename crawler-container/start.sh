#!/bin/bash
LC_ALL=C
#Config laden
. config.txt

if docker image list | grep "$imagename";then
	echo "Image bereits erstellt!"
	#exit 1
#else
	#Container-Images build
	docker image build -t "$imagename" . 
fi

if docker container ls | grep  "\b${containername}$";then
	echo "Docker Container läuft noch!"
	exit 1
fi


if docker container ls --all | grep "$containername";then
	echo "container $containername existiert schon!"
	exit 1
else
	
	#Container erstellen mit den jeweiligen Parameter
	docker container create \
	--name "$containername" \
	--hostname "$containername" \
	--network "$networkname" \
	--volume "/home/$USER/Desktop/Studium/Vernetzte_Systeme/vns/vns-docker-weather/bin:/var/www/html" \
	--publish 80:80 \
	"$imagename"
fi


#start-skript kopieren
docker container cp src/init.sh "$containername:/usr/bin"

#Container starten
docker container start "$containername"
docker exec -it "$containername" /usr/bin/init.sh

#docker run -d -v /home/sebastian/Desktop/Studium/Vernetze_Systeme/vns/vns-docker-weather/bin:/var/www/html $imagename 
#docker exec -it $containername /bin/bash

