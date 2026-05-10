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
   users = values(aws_iam_user.iam-users)[*].name
   group = aws_iam_group.developers.name

}
