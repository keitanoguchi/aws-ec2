resource "aws_eip" "eip" {
  count = var.enable_eip ? 1 : 0

  vpc      = true
  instance = aws_instance.instance.id

  depends_on = [
    aws_instance.instance
  ]
}
