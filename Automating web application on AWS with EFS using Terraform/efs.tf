# create efs

resource "aws_efs_file_system" "tfefs" {
  creation_token = "tfefs"
  tags = {
    Name = "tfefs"
  }
}


# mount efs
resource "aws_efs_mount_target" "mountefs" {
  depends_on = [
    aws_efs_file_system.tfefs
  ]
  file_system_id  = aws_efs_file_system.tfefs.id
  subnet_id       = aws_instance.web.subnet_id
  security_groups = ["${aws_security_group.http_sg.id}"]
}

# access point efs
resource "aws_efs_access_point" "efs_access" {
  depends_on = [
    aws_efs_file_system.tfefs,
  ]
  file_system_id = aws_efs_file_system.tfefs.id
}