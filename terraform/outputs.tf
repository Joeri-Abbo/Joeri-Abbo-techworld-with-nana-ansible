output "aws_public_ip_1" {
  value = aws_instance.myapp-server-1.public_ip
}

output "aws_public_ip_2" {
  value = aws_instance.myapp-server-2.public_ip
}