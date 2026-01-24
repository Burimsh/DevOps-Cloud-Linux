variable "location" {}
variable "resource_group" {}
variable "spoke_name" {}
variable "spoke_subnet_name" {}
variable "address_space" {
  type = list(string)
}
variable "subnet_prefixes" {
  type = list(string)
}
variable "admin_user" {}
variable "admin_password" {}
