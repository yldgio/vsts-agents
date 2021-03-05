variable "rg_name" {
  description = "Azure resource group Name"
  default = "aci_vsts"
}
variable "name_prefix" {
  description = "Azure resource group Name"
  default = "aci_"
}
variable "vsts_account" {
  description = "Azure Devops Organization Name"
}

variable "vsts_token" {
  description = "Azure Devops Personal access Token"
}

variable "vsts_agent" {
  description = "Azure Devops Agent Name"
  default = "ACI-Agent"
}

variable "vsts_pool" {
  description = "Azure Devops Agent Pool Name"
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
variable "container_cpu" {
  default = "1"
}
variable "container_memory" {
  default = "1.5"
}

variable "container_image" {
  description = "docker image"
  default = "yldgio/vsts-agent:centos-7"
}
variable "location" {
  description = "region where the resources should exist"
  default     = "westeurope"
}
