#module "private_compute_pool" {
#  source = "./compute"
#
#  compartment_id = module.compartment.id
#
#  subnet_id = module.vcn.private_subnet_id
#  name = "Priv node"
#  desired_instances = 2
#
#  image_name = null
#  image_operating_system = "Canonical Ubuntu"
#  image_os_version = "20.04"
#  # ampere defaults
#  ocpus = 1
#  memory = 6
#  shape = "VM.Standard.A1.Flex"
#
#  tags = var.standard_tags
#}

module "dmz_compute_pool" {
  source = "./compute"

  compartment_id = module.compartment.id

  subnet_id = module.vcn.dmz_subnet_id
  name = "DMZ node"
  desired_instances = 1

  image_name = null
  image_operating_system = "Canonical Ubuntu"
  image_os_version = "22.04"
  # ampere defaults
  ocpus = 4
  memory = 24
  shape = "VM.Standard.A1.Flex"
  boot_volume_size_in_gbs = 100
  ssh_key_file = var.ssh_key_file
  tags = var.standard_tags
  user_data = base64encode(templatefile("files/user_data_runner.tftpl", 
    {
      GITLAB_REGISTRATION_TOKEN = var.gitlab_registration_token
    }
  ))
}
