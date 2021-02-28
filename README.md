VSTS Agent Docker Image
====================
This repository was originally forked from [lenisha/vsts-agent-infrastructure](https://github.com/lenisha/vsts-agent-infrastructure)

contains `Dockerfile` definitions for [yldgio/vsts-agents](https://github.com/yldgio/vsts-agents) centos agent Docker images and the terraform configuration to deploy them in Azure Container Instances

the agents images can be built via

`docker build . -t vsts-agent:centos-7`

in order to run the container, you will need to provide the following envs:

- VSTS_ACCOUNT=[azdevops organization]
- VSTS_TOKEN=[personal access token]
- VSTS_AGENT=[name of the agent]
- VSTS_POOL=[pool name]

ex:
`docker run -e VSTS_ACCOUNT=<nme> -e VSTS_TOKEN=<pat> -e VSTS_AGENT=<agent> -e VSTS_POOL=<pool> vsts-agent:centos-7`

with env file:

`docker run --name vsts --env-file ./envfile vsts-agent:centos-7`

the agent release is frozen to version *linux-x64-2.182.1*
