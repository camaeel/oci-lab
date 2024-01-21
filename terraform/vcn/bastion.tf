resource "oci_bastion_bastion" "bastion" {
  #Required
  bastion_type = "STANDARD"
  compartment_id = var.compartment_id
  target_subnet_id = oci_core_subnet.private.id
  client_cidr_block_allow_list = ["0.0.0.0/0"]

  #Optional
  freeform_tags = var.tags
  max_session_ttl_in_seconds = 3600 # in seconds
  name = "bastion"
}
