#!/bin/bash
docker build -t vsts-agent:centos-7 --build-arg VCS_REF="git rev-parse --short HEAD" ./centos-7/.
docker tag vsts-agent:centos-7 yldgio/vsts-agent:centos-7 
docker push yldgio/vsts-agent:centos-7 


docker build -t vsts-agent:centos-7-php --build-arg VCS_REF="git rev-parse --short HEAD" ./centos-7-php/.
docker tag vsts-agent:centos-7-php yldgio/vsts-agent:centos-7-php
docker push yldgio/vsts-agent:centos-7-php