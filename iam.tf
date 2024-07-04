module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name          = "test-user"
  force_destroy = true

 # pgp_key = "keybase:test"

  password_reset_required = false
}