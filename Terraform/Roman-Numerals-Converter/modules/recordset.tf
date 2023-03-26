
data "aws_route53_zone" "selected" {
  name         =var.hosted_zone
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.recordname
  type    = "A"
  ttl     = "300"
  records = [aws_instance.roman.public_ip]
}