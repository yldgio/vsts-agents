variable "vsts_account" {
  description = "Azuree Devops Organization Name"
}

variable "vsts_token" {
  description = "Azuree Devops Personal access Token"
}

variable "vsts_agent" {
  description = "Azuree Devops Agent Name"
  default = "ACI-Agent"
}

variable "vsts_pool" {
  description = "Azuree Devops Agent Pool Name"
  default = "ACI-Pool"
}
variable "container_group_name"{
  description = "the name of the Azure container instance"
  default = "vsts-agents"

}
variable "container_name" {
  description = "the name of the container"
  default = "vsts-agent"
}
variable "container_image" {
  description = "docker image"
  default = "yldgio/vsts-agent:centos-7"
}
variable "location" {
  description = "region where the resources should exist"
  default     = "westeurope"
}
