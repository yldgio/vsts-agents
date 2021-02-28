VSTS Agent Docker Image
====================
This repository was forked from [lenisha/vsts-agent-infrastructure](https://github.com/lenisha/vsts-agent-infrastructure)

contains `Dockerfile` definitions for [yldgio/vsts-agent-infrastructure](https://github.com/yldgio/vsts-agent-infrastructure) Docker images.

`docker build . -t vsts-agent:centos-7`

`docker run --name vsts --env-file ./envfile vsts-agent:centos-7`

requires the following envs:

- VSTS_ACCOUNT=[azdevops organization]
- VSTS_TOKEN=[personal access token]
- VSTS_AGENT=[name of the agent]
- VSTS_POOL=[pool name]

the agent release is frozen to *linux-x64-2.182.1*