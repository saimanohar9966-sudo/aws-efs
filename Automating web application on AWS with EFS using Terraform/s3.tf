#Creating S3 Bucket


resource "aws_s3_bucket" "bucket" {
  bucket = "sai-manohar-9966-9966"
  # acl    = "public-read"
}


output "bucket" {
  value = aws_s3_bucket.bucket
}


resource "aws_s3_bucket_object" "bucket_obj" {
  bucket = aws_s3_bucket.bucket.id
  key    = "download.png"
  source = "./gitcode/download.png"
  # acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}