resource "oci_core_internet_gateway" "inet_gw" {
  #Required
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
  display_name = "Internet gateway"
  freeform_tags = var.tags
}

resource "oci_core_nat_gateway" "nat_gw" {
  #Required
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
#  block_traffic = var.nat_gateway_block_traffic
  display_name = "Nat Gateway"
  freeform_tags = var.tags
#  public_ip_id = oci_core_public_ip.test_public_ip.id
}