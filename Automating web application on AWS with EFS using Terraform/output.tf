# Saving IP of the instance in a file

output "instance_ip" {
  value = aws_instance.web.public_ip
}
resource "null_resource" "nulllocal" {
  provisioner "local-exec" {
    command = "echo  ${aws_instance.web.public_ip} > publicip.txt"
  }
}