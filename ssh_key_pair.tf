resource "aws_key_pair" "key_pair" {
  count = var.enable_ssh ? 1 : 0

  key_name   = var.key_name
  public_key = var.public_key
  tags       = var.tags
}
