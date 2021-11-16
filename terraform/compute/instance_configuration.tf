resource "oci_core_instance_configuration" "this" {
  compartment_id = var.compartment_id
  freeform_tags = var.tags
  #Optional
  display_name = var.name

  instance_details {
    #Required
    instance_type = "compute"

    #Optional
#    block_volumes {
#
#      #Optional
#      attach_details {
#        #Required
#        type = var.instance_configuration_instance_details_block_volumes_attach_details_type
#
#        #Optional
#        device = var.instance_configuration_instance_details_block_volumes_attach_details_device
#        display_name = var.instance_configuration_instance_details_block_volumes_attach_details_display_name
#        is_pv_encryption_in_transit_enabled = var.instance_configuration_instance_details_block_volumes_attach_details_is_pv_encryption_in_transit_enabled
#        is_read_only = var.instance_configuration_instance_details_block_volumes_attach_details_is_read_only
#        is_shareable = var.instance_configuration_instance_details_block_volumes_attach_details_is_shareable
#        use_chap = var.instance_configuration_instance_details_block_volumes_attach_details_use_chap
#      }
#      create_details {
#
#        #Optional
#        availability_domain = var.instance_configuration_instance_details_block_volumes_create_details_availability_domain
#        backup_policy_id = data.oci_core_volume_backup_policies.test_volume_backup_policies.volume_backup_policies.0.id
#        compartment_id = var.compartment_id
#        defined_tags = {"Operations.CostCenter"= "42"}
#        display_name = var.instance_configuration_instance_details_block_volumes_create_details_display_name
#        freeform_tags = {"Department"= "Finance"}
#        kms_key_id = oci_kms_key.test_key.id
#        size_in_gbs = var.instance_configuration_instance_details_block_volumes_create_details_size_in_gbs
#        source_details {
#          #Required
#          type = var.instance_configuration_instance_details_block_volumes_create_details_source_details_type
#
#          #Optional
#          id = var.instance_configuration_instance_details_block_volumes_create_details_source_details_id
#        }
#        vpus_per_gb = var.instance_configuration_instance_details_block_volumes_create_details_vpus_per_gb
#      }
#      volume_id = oci_core_volume.test_volume.id
#    }

    launch_details {
      compartment_id = var.compartment_id
      #Optional
      agent_config {

        #Optional
        are_all_plugins_disabled = false
        is_management_disabled = false
        is_monitoring_disabled = false
#        plugins_config {
#          #Required
#          desired_state = var.instance_configuration_instance_details_launch_details_agent_config_plugins_config_desired_state
#          name = var.instance_configuration_instance_details_launch_details_agent_config_plugins_config_name
#        }
      }
      availability_config {

        #Optional
        recovery_action = "RESTORE_INSTANCE"
      }
#      availability_domain = var.instance_configuration_instance_details_launch_details_availability_domain

#      create_vnic_details {
#
#        #Optional
#        assign_private_dns_record = var.instance_configuration_instance_details_launch_details_create_vnic_details_assign_private_dns_record
#        assign_public_ip = var.instance_configuration_instance_details_launch_details_create_vnic_details_assign_public_ip
#        defined_tags = {"Operations.CostCenter"= "42"}
#        display_name = var.instance_configuration_instance_details_launch_details_create_vnic_details_display_name
#        freeform_tags = {"Department"= "Finance"}
#        hostname_label = var.instance_configuration_instance_details_launch_details_create_vnic_details_hostname_label
#        nsg_ids = var.instance_configuration_instance_details_launch_details_create_vnic_details_nsg_ids
#        private_ip = var.instance_configuration_instance_details_launch_details_create_vnic_details_private_ip
#        skip_source_dest_check = var.instance_configuration_instance_details_launch_details_create_vnic_details_skip_source_dest_check
#        subnet_id = oci_core_subnet.test_subnet.id
#      }
      display_name = var.name
#      extended_metadata = var.instance_configuration_instance_details_launch_details_extended_metadata
      freeform_tags = var.tags
      instance_options {
        #Optional
        are_legacy_imds_endpoints_disabled = true
      }
      is_pv_encryption_in_transit_enabled = true
      launch_mode = "PARAVIRTUALIZED"
#      launch_options {
#
#        #Optional
##        boot_volume_type = "PARAVIRTUALIZED"
##        firmware = "UEFI_64"
#        is_consistent_volume_naming_enabled = var.instance_configuration_instance_details_launch_details_launch_options_is_consistent_volume_naming_enabled
##        network_type = "PARAVIRTUALIZED"
#        remote_data_volume_type = "PARAVIRTUALIZED"
#      }
      metadata = {
        ssh_authorized_keys =  file("~/.ssh/id_rsa.pub"),
#        user_data = "TODO"
      }
#      platform_config {
#        #Required
#        type = var.instance_configuration_instance_details_launch_details_platform_config_type
#
#        #Optional
#        is_measured_boot_enabled = var.instance_configuration_instance_details_launch_details_platform_config_is_measured_boot_enabled
#        is_secure_boot_enabled = var.instance_configuration_instance_details_launch_details_platform_config_is_secure_boot_enabled
#        is_trusted_platform_module_enabled = var.instance_configuration_instance_details_launch_details_platform_config_is_trusted_platform_module_enabled
#        numa_nodes_per_socket = var.instance_configuration_instance_details_launch_details_platform_config_numa_nodes_per_socket
#      }
#      preemptible_instance_config {
#        #Required
#        preemption_action {
#          #Required
#          type = var.instance_configuration_instance_details_launch_details_preemptible_instance_config_preemption_action_type
#
#          #Optional
#          preserve_boot_volume = var.instance_configuration_instance_details_launch_details_preemptible_instance_config_preemption_action_preserve_boot_volume
#        }
#      }
      preferred_maintenance_action = "LIVE_MIGRATE"
      shape = var.shape
      shape_config {

        #Optional
        baseline_ocpu_utilization = var.baseline_ocpu_utilization
        memory_in_gbs = var.memory
        ocpus = var.ocpus
      }
      source_details {
        #Required
        source_type = "image"

        #Optional
#        boot_volume_id = oci_core_boot_volume.test_boot_volume.id
#        boot_volume_size_in_gbs = var.instance_configuration_instance_details_launch_details_source_details_boot_volume_size_in_gbs
        image_id = data.oci_core_images.this.images[0].id
      }
    }

  }
}
