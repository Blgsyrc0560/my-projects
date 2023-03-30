module "kittens" {
  source = "../modules"
  s3_bucket_name  = "kittens.bekirokutan.com"
  hosted_zone     = "bekirokutan.com"
  }