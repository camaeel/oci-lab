module "compartment" {
  source = "./compartment"

  parent_compartment_id = var.tenancy_id
  name = "oci-home-lab"
  enable_delete = false # explicitly say to delete

  tags = var.standard_tags
}
