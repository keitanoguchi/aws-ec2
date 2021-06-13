output "eip" {
  value = var.enable_eip ? aws_eip.eip.0.public_ip : null
}
