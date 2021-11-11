variable "tenancy_id" {
  type = string
}

variable "standard_tags" {
  type = map(string)
  description = "Default tags added to every resource"
}

variable "vcn_cidrs" {
  type = list(string) 
  description = "Cidr lists for vcn"
}