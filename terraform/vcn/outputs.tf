output "public_subnet_id" {
  value = oci_core_subnet.public.id
}

output "dmz_subnet_id" {
  value = oci_core_subnet.dmz.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private.id
}
