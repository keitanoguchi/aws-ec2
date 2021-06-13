resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  user_data              = var.user_data
  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )

  lifecycle {
    ignore_changes = [
      ami
    ]
  }

  depends_on = [
    aws_security_group.sg
  ]
}
