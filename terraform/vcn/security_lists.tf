resource "oci_core_security_list" "private" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.this.id


    display_name = "Private subnet security list"
    egress_security_rules {
        #Required
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"

        description = "Allow all egress"
        stateless = false
    }

    freeform_tags = var.tags
    ingress_security_rules {
        #Required
        protocol = "6" #TCP
        # source = "${oci_bastion_bastion.bastion.private_endpoint_ip_address}/32"
        source = var.vcn_cidrs[0]
        source_type = "CIDR_BLOCK"

        #Optional
        description = "allow bastion ssh access"

        stateless = false
        tcp_options {
            max = 22
            min = 22
        }
    }
    ingress_security_rules {
        #Required
        protocol = "1" #ICMP
        # source = "${oci_bastion_bastion.bastion.private_endpoint_ip_address}/32"
        source = var.vcn_cidrs[0]
        source_type = "CIDR_BLOCK"

        #Optional
        description = "allow ICMP access"
        stateless = false
    }
}

resource "oci_core_security_list" "public" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.this.id


    display_name = "Public subnet security list"
    egress_security_rules {
        #Required
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"

        description = "Allow all egress"
        stateless = false
    }

    freeform_tags = var.tags
    ingress_security_rules {
        #Required
        protocol = "6" #TCP
        # source = "${oci_bastion_bastion.bastion.private_endpoint_ip_address}/32"
        source = var.vcn_cidrs[0]
        source_type = "CIDR_BLOCK"

        #Optional
        description = "allow bastion ssh access"

        stateless = false
        tcp_options {
            max = 22
            min = 22
        }
    }
    ingress_security_rules {
        #Required
        protocol = "1" #ICMP
        # source = "${oci_bastion_bastion.bastion.private_endpoint_ip_address}/32"
        source = var.vcn_cidrs[0]
        source_type = "CIDR_BLOCK"

        #Optional
        description = "allow ICMP access"
        stateless = false
    }
}