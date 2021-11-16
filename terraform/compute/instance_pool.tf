resource "oci_core_instance_pool" "this" {
  #Required
  compartment_id = var.compartment_id
  instance_configuration_id = oci_core_instance_configuration.this.id
  dynamic "placement_configurations" {
    for_each = data.oci_identity_availability_domains.ads.availability_domains
    content {
      availability_domain = placement_configurations.value.name
      primary_subnet_id = var.subnet_id
    }
  }

  size = var.desired_instances

  #Optional
  display_name = var.name
  freeform_tags = var.tags
#  load_balancers {
#    #Required
#    backend_set_name = oci_load_balancer_backend_set.test_backend_set.name
#    load_balancer_id = oci_load_balancer_load_balancer.test_load_balancer.id
#    port = var.instance_pool_load_balancers_port
#    vnic_selection = var.instance_pool_load_balancers_vnic_selection
#  }
}