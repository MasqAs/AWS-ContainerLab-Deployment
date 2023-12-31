data "aws_route53_zone" "selected" {
  zone_id = var.AWS_R53_ZONE_ID
}

resource "aws_route53_record" "containerlab_fqdn" {
  count = var.AWS_R53_ENABLED ? 1 : 0
  zone_id = var.AWS_R53_ZONE_ID
  name    = "containerlab"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.containerlab_host.public_ip]
}