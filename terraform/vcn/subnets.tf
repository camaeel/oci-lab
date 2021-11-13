resource "oci_core_subnet" "private" {
  #Required
  cidr_block = cidrsubnet(var.vcn_cidrs[0], 1, 0)
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
#  defined_tags = {"Operations.CostCenter"= "42"}
#  dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  display_name = "Private subnet"
  dns_label = "private"
  freeform_tags = var.tags
  prohibit_internet_ingress = true
  prohibit_public_ip_on_vnic = true
#  route_table_id = oci_core_route_table.test_route_table.id
#  security_list_ids = var.subnet_security_list_ids
}

resource "oci_bastion_bastion" "private_bastion" {
  #Required
  bastion_type     = "standard"
  compartment_id   = var.compartment_id
  target_subnet_id = oci_core_subnet.private.id
  client_cidr_block_allow_list = ["0.0.0.0/0"]

  #Optional
  freeform_tags              = var.tags
  max_session_ttl_in_seconds = 3600 # in seconds
  name                       = replace("${oci_core_subnet.private.display_name} bastion", " ", "")
}

resource "oci_core_subnet" "public" {
  #Required
  cidr_block = cidrsubnet(var.vcn_cidrs[0], 1, 1)
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
#  defined_tags = {"Operations.CostCenter"= "42"}
#  dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  display_name = "Public subnet"
  dns_label = "public"
  freeform_tags = var.tags
  prohibit_internet_ingress = true
  prohibit_public_ip_on_vnic = true
#  route_table_id = oci_core_route_table.test_route_table.id
#  security_list_ids = var.subnet_security_list_ids
}

resource "oci_bastion_bastion" "public_bastion" {
  #Required
  bastion_type = "standard"
  compartment_id = var.compartment_id
  target_subnet_id = oci_core_subnet.public.id
  client_cidr_block_allow_list = ["0.0.0.0/0"]

  #Optional
  freeform_tags = var.tags
  max_session_ttl_in_seconds = 3600 # in seconds
  name = replace("${oci_core_subnet.public.display_name} bastion", " ", "")
}
