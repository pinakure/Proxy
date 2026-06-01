#!/bin/bash

mkdir -p /data/iskarion/postgres_data
alias dwatch="clear; docker ps; sleep 1;clear; docker ps;sleep 1;clear;docker ps; sleep 1; clear; docker ps;sleep 1; clear;docker ps; sleep 1; clear; docker ps;"
docker compose up -d --build --remove-orphans
