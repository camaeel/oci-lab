resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_id

  cidr_blocks = var.vcn_cidrs

  dns_label = "ocilab"
  freeform_tags = var.tags
}
