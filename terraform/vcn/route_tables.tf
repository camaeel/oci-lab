resource "oci_core_route_table" "public" {
  #Required
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
  display_name = "public subnet"
  freeform_tags = var.tags
  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.inet_gw.id

    #Optional
    description = "Default outbound"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
}

resource "oci_core_route_table" "private" {
  #Required
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.this.id

  #Optional
  display_name = "public subnet"
  freeform_tags = var.tags
  route_rules {
    #Required
    network_entity_id = oci_core_nat_gateway.nat_gw.id

    #Optional
    description = "Default outbound"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
}