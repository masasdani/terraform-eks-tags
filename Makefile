# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache version 2
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

export PATH_WORKSPACE="src"
export PATH_SCRIPT="scripts"
export PATH_COMPOSE="compose"
export PATH_DOCKER="compose/docker"
export PROJECT_NAME="terraform-eks-tags"

export CI_REGISTRY     ?= hub.docker.com
export CI_PROJECT_PATH ?= zeroc0d3

IMAGE          = $(CI_REGISTRY)/${CI_PROJECT_PATH}/zeroc0d3-eks-tags
DIR            = $(shell pwd)
VERSION       ?= 1.3.0

BASE_IMAGE     = ubuntu
BASE_VERSION   = 20.04

.PHONY: run stop remove build push push-container sub-official sub-community sub-all
run:
	@echo "============================================"
	@echo " Task      : Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@./run-docker.sh
	@echo '- DONE -'

stop:
	@echo "============================================"
	@echo " Task      : Stopping Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@docker-compose -f ${PATH_COMPOSE}/app-compose.yml stop
	@echo '- DONE -'

remove:
	@echo "============================================"
	@echo " Task      : Remove Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@docker-compose -f ${PATH_COMPOSE}/app-compose.yml down
	@echo '- DONE -'

build:
	@echo "============================================"
	@echo " Task      : Create Docker Image "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./docker-build.sh
	@echo '- DONE -'

push:
	@echo "============================================"
	@echo " Task      : Push Docker Image "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./docker-push.sh
	@echo '- DONE -'

push-container:
	@echo "============================================"
	@echo " Task      : Push Docker Hub "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./docker-build.sh
	@cd ${PATH_DOCKER} && ./docker-push.sh
	@echo '- DONE -'

sub-official:
	@echo "============================================"
	@echo " Task      : Get Official Submodules "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@./get-official.sh
	@echo '- DONE -'

sub-community:
	@echo "============================================"
	@echo " Task      : Get Community Submodules "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@./get-community.sh
	@echo '- DONE -'

sub-all:
	@echo "============================================"
	@echo " Task      : Get All Submodules "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@git submodule update --init --recursive
	@echo '- DONE -'