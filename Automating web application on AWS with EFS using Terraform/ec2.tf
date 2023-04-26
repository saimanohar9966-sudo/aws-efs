#Launching Instance

resource "aws_instance" "web" {
  depends_on = [
    aws_efs_file_system.tfefs
  ]
  ami             = "ami-0447a12f28fddb066"
  instance_type   = "t2.micro"
  key_name        = "ec2-bastion"
  security_groups = ["http_sg"]


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("ec2-bastion.pem")
    host        = aws_instance.web.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      "sudo su <<END",
      "yum install git php httpd amazon-efs-utils -y",
      "rm -rf /var/www/html/*",
      "/usr/sbin/httpd",
      "efs_id=${aws_efs_file_system.tfefs.id}",
      "mount -t efs $efs_id:/ /var/www/html",
      "git clone https://github.com/saimanohar9966-sudo/aws-efs.git /var/www/html/",
      "END",
    ]
  }

  tags = {
    Name = "aws-efs"
  }
}