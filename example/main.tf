module "main" {
  source = "../"

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  instance_name = "ubuntu"
  subnet_id     = "subnet-hoge"
  vpc_id        = "vpc-hoge"
  sg_name       = "sg-for-ubuntu"
  sg_rules = [
    {
      for_each_key = "out_all"
      type         = "egress"
      cidr_blocks  = ["0.0.0.0/0"]
      from_port    = 0
      to_port      = 0
      protocol     = "-1"
    }
  ]
  enable_ssh = true
  key_name   = "ubuntu"
  public_key = "hoge"
  tags = {
    ManagedBy = "Terraform"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
