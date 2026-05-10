resource "aws_iam_user" "iam-users" {
   name = each.value
   for_each = toset(var.username)
   tags = {
      Description = "IAM user created via Terraform"
   }

}

resource "aws_iam_group" "developers" {
   name = "developers"

}

resource "aws_iam_group_membership" "team_membership" {
   name  = "developers-group-membership"
   users = values(aws_iam_user.iam-users)[*].name
   group = aws_iam_group.developers.name

}

resource "aws_iam_group_policy_attachment" "attach-policy" {
   group = aws_iam_group.developers.name
   policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"

}
