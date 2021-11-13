module "vcn" {
  source = "./vcn"

  compartment_id = module.compartment.id

  vcn_cidrs = var.vcn_cidrs
  
  tags = var.standard_tags

}