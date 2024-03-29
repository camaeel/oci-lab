variable "compartment_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "desired_instances" {
  type = number
}

variable "name" {
  type = string
}

variable "tags" {
  type = map(string)
  description = "Default tags added to every resource"
}

variable "baseline_ocpu_utilization" {
  type = string
  default = "BASELINE_1_1"
  description = "Burstable instances. By default not. Possible values: BASELINE_1_1, BASELINE_1_2, BASELINE_1_8"
}

variable "ocpus" {
  type = number
  default = null
}

variable "memory" {
  type = number
  default = null
}

variable "shape" {
  type = string
}

variable "image_name" {
  type = string
}

variable "image_os_version" {
  type = string
}

variable "image_operating_system" {
  type = string
}

variable "boot_volume_size_in_gbs" {
  type = number
  default = 50
}

variable "ssh_key_file" {
  description = "Path to ssh public key"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "user_data" {
  default = ""
  type = string
  description = "User data"
}
