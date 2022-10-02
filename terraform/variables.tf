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

variable "ssh_key_file" {
  description = "Path to ssh public key"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "gitlab_registration_token" {
  type = string
  description = "Token for registering gitlab.com runners"
}
