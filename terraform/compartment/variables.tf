variable "parent_compartment_id" {
  type = string
}

variable "name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "enable_delete" {
  type = bool
  default = false
}