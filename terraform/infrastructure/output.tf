output "web-lb-dns-name" {
  value = "${module.instances.web-lb-dns-name}"
}

output "web-instance-ips" {
  value = "${module.instances.web-instance-ips}"
}
