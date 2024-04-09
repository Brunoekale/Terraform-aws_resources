# Terraform codes to create S3 bucket
module "bucket_name" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}
