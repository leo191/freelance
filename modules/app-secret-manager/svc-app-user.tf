resource "aws_iam_user_policy" "msk_svc_policy" {
  name = "msk-${var.env}-svc-${var.application}-policy"
  user = aws_iam_user.svc_user.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(var.app_policy)
}

resource "aws_iam_user" "svc_user" {
  name = "svc-${var.env}-${var.application}-stage"
  path = "/"
}