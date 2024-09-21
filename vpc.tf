module "vpc" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git"
  #version = "5.13.0"

  # VPC Basic Details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets  
}