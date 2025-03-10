module "agent" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Agent"

  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_security_group.default_vpc_sg_id.id]
  ami = data.aws_ami.ami_info.id
  user_data = file("jenkins.sh")
  tags = {
    Name = "Agent"
  }
}
resource "aws_route53_record" "agent" {
  zone_id = data.aws_route53_zone.selected.zone_id
  allow_overwrite = true
  name    = "agent.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = [module.agent.public_ip]
}
