module "compartment" {
  source = "./compartment"

  parent_compartment_id = var.tenancy_id
  name = "oci-home-lab"

  tags = var.standard_tags
}
