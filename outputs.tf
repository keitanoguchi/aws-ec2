output "eip" {
  value = var.enable_eip ? aws_eip.eip.public_ip : null
}
