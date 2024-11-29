variable "stgacntrg" {
  type        = string
  description = "The resource group of the storage account for az landingzone tf state"
}

variable "stgacnt" {
  type        = string
  description = "The storage account for az landingzone tf state"
}

variable "stgcontainer" {
  type        = string
  description = "The storage container for az landingzone tf state"
}

variable "parent_group_id" {
  type        = string
  description = "ID of the parent management group"
}