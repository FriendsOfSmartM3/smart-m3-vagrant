#!/bin/bash
sed 's/us/it/g' -i /etc/apt/sources.list

apt-get update 
