resource "oci_core_subnet" "private" {
  #Required
  cidr_block = cidrsubnet(var.vcn_cidrs[0], 2, 0)
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
  route_table_id = oci_core_route_table.private.id
#  security_list_ids = var.subnet_security_list_ids
}

resource "oci_core_subnet" "dmz" {
  #Required
  cidr_block = cidrsubnet(var.vcn_cidrs[0], 2, 1)
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
#  defined_tags = {"Operations.CostCenter"= "42"}
#  dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  display_name = "DMZ subnet"
  dns_label = "dmz"
  freeform_tags = var.tags
  prohibit_internet_ingress = true
  prohibit_public_ip_on_vnic = true
  route_table_id = oci_core_route_table.private.id
#  security_list_ids = var.subnet_security_list_ids
}

resource "oci_core_subnet" "public" {
  #Required
  cidr_block = cidrsubnet(var.vcn_cidrs[0], 2, 2)
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
  #  defined_tags = {"Operations.CostCenter"= "42"}
  #  dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  display_name = "Public subnet"
  dns_label = "public"
  freeform_tags = var.tags
  prohibit_internet_ingress = false
  prohibit_public_ip_on_vnic = false
  route_table_id = oci_core_route_table.public.id
  #  security_list_ids = var.subnet_security_list_ids
}
