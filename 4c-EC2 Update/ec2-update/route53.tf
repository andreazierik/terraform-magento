// Hosted Zone
data "aws_route53_zone" "hosted_zone" {
  name         = "brunoferreira86dev.com"
  private_zone = false
}

// DNS Record - A
resource "aws_route53_record" "record_A" {

  allow_overwrite = true
  zone_id         = data.aws_route53_zone.hosted_zone.zone_id
  name            = "brunoferreira86dev.com"
  type            = "A"
  ttl             = 300
  records         = [aws_instance.vm-1.public_ip]
}

// DNS Record - CNAME - www
resource "aws_route53_record" "record_WWW" {

  allow_overwrite = true
  zone_id         = data.aws_route53_zone.hosted_zone.zone_id
  name            = "www.brunoferreira86dev.com"
  type            = "A"
  ttl             = 300
  records         = [aws_instance.vm-1.public_ip]
}