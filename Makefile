UID := $(shell id -u)

install:
	mkdir ../../../app
	git clone --recursive git@gitlab.kuantic.com:backoffice/scm/scm.git ../../../app/scm
	git clone --recursive git@gitlab.kuantic.com:backoffice/intranet.git ../../../app/intranet

build :
	[ -f .env ]||cp .env-example .env; export LOCAL_UID=${UID} ; export LOCAL_USER=${USER} ; docker compose build
.PHONY : build

stop :
	[ -f .env ]||cp .env-example .env; export LOCAL_UID=${UID} ; export LOCAL_USER=${USER} ; docker compose down --remove-orphans
.PHONY : stop

up :
	[ -f .env ]||cp .env-example .env; export LOCAL_UID=${UID} ; export LOCAL_USER=${USER} ; docker compose up -d
.PHONY : up

start :
	[ -f .env ]||cp .env-example .env; export LOCAL_UID=${UID} ; export LOCAL_USER=${USER} ; docker compose up
.PHONY : start