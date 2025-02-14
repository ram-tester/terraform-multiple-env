variable "instances" {
 default = ["mysql","fronend","backend"]
}

variable "project" {
  default = "expense"
}

variable "environment" {
}

variable "domain_name" {
  default = "altodevops.online"
}
variable "common_tags" {
  type = map
  default = {
    project="expense"
    Terraform="true"
  }
}

variable "zone_id" {
  default = "Z0410737TPA4V2DGJQOZ"
}