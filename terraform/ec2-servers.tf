#resource "aws_instance" "myapp-server-1" {
#  ami           = var.ami
#  instance_type = var.instance_type
#
#  subnet_id              = aws_subnet.myapp-subnet-1.id
#  vpc_security_group_ids = [
#    aws_default_security_group.default-sg.id
#  ]
#  availability_zone = var.avail_zone
#
#  associate_public_ip_address = true
#  key_name                    = aws_key_pair.ssh-key.key_name
#
#  tags = {
#    Name : "${var.env_prefix}-server"
#  }
#}
#
#resource "aws_instance" "myapp-server-2" {
#  ami           = var.ami
#  instance_type = var.instance_type
#
#  subnet_id              = aws_subnet.myapp-subnet-1.id
#  vpc_security_group_ids = [
#    aws_default_security_group.default-sg.id
#  ]
#  availability_zone = var.avail_zone
#
#  associate_public_ip_address = true
#  key_name                    = aws_key_pair.ssh-key.key_name
#
#  tags = {
#    Name : "${var.env_prefix}-server"
#  }
#}


resource "aws_instance" "myapp-server-3" {
  ami           = data.aws_ami.latest-amazon-linux-image.id
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

resource "null_resource" "configure_server" {

  triggers = {
    trigger = aws_instance.myapp-server-3.public_ip
  }
  provisioner "local-exec" {
    working_dir = "/Users/joeriabbo/Sites/devops/techworld-with-nana/Joeri-Abbo-techworld-with-nana-ansible"
    command     = "ansible-playbook --inventory ${aws_instance.myapp-server-3.public_ip}, --private-key ${var.ssh_key_private} --user ec2-user deploy-docker-new.yaml"
  }
}
