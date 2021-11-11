variable "compartment_id" {
  type = string
}

variable "vcn_cidrs" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  description = "Default tags added to every resource"
}
