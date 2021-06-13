resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name = var.sg_name
    },
    var.tags
  )
}

resource "aws_security_group_rule" "in_ssh" {
  count = var.enable_ssh ? 1 : 0

  security_group_id = aws_security_group.sg.id
  type              = "ingress"
  cidr_blocks       = var.ssh_cidr_blocks
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  depends_on = [
    aws_security_group.sg
  ]
}

resource "aws_security_group_rule" "sg_rule" {
  for_each = {
    for sg_rule in var.sg_rules : sg_rule.for_each_key => sg_rule
  }

  security_group_id = aws_security_group.sg.id
  type              = each.value.type
  cidr_blocks       = each.value.cidr_blocks
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol

  depends_on = [
    aws_security_group.sg
  ]
}
