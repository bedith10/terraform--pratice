//output "aws_instance_public_dns" {
//    value = aws_instance.public_ec2.aws_instance.public_dns
//}

output "aws_public_ec2_public_dns" {
  value = aws_lb.main_lb.dns_name

}