UID := $(shell id -u)

install:

build :
	[ -f .env ]|| export LOCAL_UID=${UID} ; export LOCAL_USER=${USER} ; docker compose build
.PHONY : build

stop :
	docker stop test_phpmyadmin_dockerSymfony
	docker stop test_www_dockerSymfony
	docker stop test_maildev_dockerSymfony 
	docker stop test_db_dockerSymfony
.PHONY : stop

up :
	docker start test_phpmyadmin_dockerSymfony
	docker start test_www_dockerSymfony
	docker start test_maildev_dockerSymfony 
	docker start test_db_dockerSymfony
.PHONY : up

start :
	[ -f .env ]|| export LOCAL_UID=${UID} ; export LOCAL_USER=${USER} ; docker compose up
.PHONY : start