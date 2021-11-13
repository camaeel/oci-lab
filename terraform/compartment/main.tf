resource "oci_identity_compartment" "this" {
    #Required
    compartment_id = var.parent_compartment_id
    description = "Compartment for ${var.name}"
    name = var.name
    enable_delete = var.enable_delete

    # #Optional
    # defined_tags = {"Operations.CostCenter"= "42"}
    # freeform_tags = {"Department"= "Finance"}
    freeform_tags = var.tags
}
