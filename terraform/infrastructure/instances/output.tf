output "web-lb-dns-name" {
  value = "${aws_lb.web.dns_name}"
}

output "web-instance-ips" {
  value = "${aws_instance.web.*.public_ip}"
}
