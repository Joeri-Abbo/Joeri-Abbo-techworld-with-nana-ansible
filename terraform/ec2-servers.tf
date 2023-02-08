resource "aws_instance" "myapp-server-1" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [
    aws_default_security_group.default-sg.id
  ]
  availability_zone = var.avail_zone

  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name

  tags = {
    Name : "${var.env_prefix}-server"
  }
}

resource "aws_instance" "myapp-server-2" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [
    aws_default_security_group.default-sg.id
  ]
  availability_zone = var.avail_zone

  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name

  tags = {
    Name : "${var.env_prefix}-server"
  }
}
