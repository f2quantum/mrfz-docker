build:
	sh build.sh


clean:
	rm -rf ./resources/*

run:
	sudo docker run -d -p 2222:22 -p 5900:5900 -p 33389:3389 --name mrfz-docker -e SIZE=1920x1080 mrfz-docker

up:
	sudo docker-compose up -d

restart:
	sudo docker-compose restart

down:
	sudo docker-compose down

install-docker:
	 sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun