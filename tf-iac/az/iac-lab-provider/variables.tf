variable "name" {
     type = string
     default = "my-loki"
}
variable "location" {
     type = string
     default = "westus2"
}
variable "resource_group_name" {
     type = string
     default = "like-and-test-dev"
}
variable "ssh_key" {
  default = "~/.ssh/id_rsa.pub"
}