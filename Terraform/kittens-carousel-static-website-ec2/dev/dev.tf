module "kittens" {
  source = "../modules"
  keyname = "first-key"
  git-adres = "https://raw.githubusercontent.com/bekirokutan/my-projects/main/Terraform/kittens-carousel-static-website-ec2/static-web"
}