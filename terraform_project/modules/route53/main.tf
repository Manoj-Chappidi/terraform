variable "nat_gateway_ip" {
  description = "Public IP of NAT Gateway"
}

resource "aws_route53_zone" "main" {
  name = "demo.mynginx.com"  
}

resource "aws_route53_record" "nginx_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = ".com"  
  type    = "A"
  ttl     = "300"

  records = [var.nat_gateway_ip]
}
