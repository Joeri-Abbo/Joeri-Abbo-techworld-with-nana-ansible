variable "avail_zone" {
  default = "eu-west-3b"
}
variable "vpc_cider_block" {
  default = "10.0.0.0/16"
}
variable "subnet_cider_block" {
  default = "10.0.100.0/24"
}
variable "env_prefix" {
  default = "dev"
}
variable "my_ip" {
  default = "0.0.0.0/0"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "public_key_location" {
  default = "/Users/joeriabbo/.ssh/id_rsa.pub"
}
variable "ami" {
  default = "ami-0afd55c0c8a52973a"
}