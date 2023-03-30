resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.kittens.id
  key    = "index.html"
  source = "../static_website/index.html"
  content_type = "text/html"
}
resource "aws_s3_object" "cat0" {
  bucket = aws_s3_bucket.kittens.id
  key    = "cat0.jpg"
  source = "../static_website/cat0.jpg"
}
resource "aws_s3_object" "cat1" {
  bucket = aws_s3_bucket.kittens.id
  key    = "cat1.jpg"
  source = "../static_website/cat1.jpg"
}
resource "aws_s3_object" "cat2" {
  bucket = aws_s3_bucket.kittens.id
  key    = "cat2.jpg"
  source = "../static_website/cat2.jpg"
}