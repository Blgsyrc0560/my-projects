module "kittens" {
  source = "../modules"
  keyname = "first-key"
  hosted_zone = "bekirokutan.com"
  recordname  = "www.bekirokutan.com"
  }