#Download Github Repository

resource "null_resource" "nulllocal2" {
  provisioner "local-exec" {
    command = "git clone https://github.com/saimanohar9966-sudo/aws-efs.git ./gitcode"
  }

}