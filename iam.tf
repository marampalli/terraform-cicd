
##############
# IAM account
##############
module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.39.1"

  name = "test-user"

  minimum_password_length = 6
  require_numbers         = false
}
