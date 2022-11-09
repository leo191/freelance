resource "aws_iam_user_policy" "secret_svc_policy" {
  name = "secret-${var.env}-svc-${var.application}-policy"
  user = aws_iam_user.secret_user.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(var.secret_policy)
}

resource "aws_iam_user" "secret_user" {
  name = "svc-${var.env}-${var.application}-secret-stage"
  path = "/"
}