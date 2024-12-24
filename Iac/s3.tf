# Recurso S3 Bucket em ap-southeast-2
# resource "aws_s3_bucket" "s3" {
#   provider = aws.ap-southeast-2

#   bucket        = "s3-bucket-ap-southeast-2-maneiro"
#   force_destroy = true

#   lifecycle {
#     prevent_destroy = true
#   }

#   tags = {
#     Name = "S3 Bucket"
#     Iac  = "True"
#   }
# }

# resource "aws_s3_bucket" "s3" {
#   bucket        = "s3-bucket"
#   force_destroy = true

#   lifecycle {
#     prevent_destroy = true
#   }

#   tags = {
#     Name = "S3 Bucket"
#     Iac  = "True"
#   }
# }


# resource "aws_s3_bucket_versioning" "versioning_s3" {
#   bucket = aws_s3_bucket.s3.bucket

#   versioning_configuration {
#     status = "Enabled"
#   }
# }
