variable "tags" {
  type = map(any)
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "sg_rules" {
  type = list(object({
    for_each_key = string
    type         = string
    cidr_blocks  = list(string)
    from_port    = number
    to_port      = number
    protocol     = string
  }))
}

variable "enable_ssh" {
  type    = bool
  default = false
}

variable "ssh_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "key_name" {
  type    = string
  default = null
}

variable "public_key" {
  type    = string
  default = null
}

variable "user_data" {
  type    = string
  default = null
}

variable "enable_eip" {
  type    = bool
  default = false
}
