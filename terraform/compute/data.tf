data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_core_images" "this" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  display_name = var.image_name
  operating_system = var.image_operating_system
#  operating_system_version = var.image_operating_system_version
  shape = var.shape
#  state = var.image_state
  sort_by = "TIMECREATED"
  sort_order = "DESC"
}