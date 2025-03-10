data "aws_ami" "ami_info" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["973714476881"] # Specify the owner (e.g., Amazon AMIs)
}

data "aws_route53_zone" "selected" {
  name         = "hellandhaven.xyz"
  private_zone = false
}
data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default_vpc_sg_id" {
  name = "default"  # Replace with the actual name if different
  vpc_id = data.aws_vpc.default.id
}

# data "aws_ssm_parameter" "bastion_sg_id" {
#   name = "/${var.project_name}/${var.environment}/bastion_sg_id"
# }

# data "aws_ssm_parameter" "public_subnet_ids" {
#   name = "/${var.project_name}/${var.environment}/public_subnet_ids"
# }