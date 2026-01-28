variable "cluster_role_name" {
  type        = string
  description = "Name of the cluster role"
  default     = "eksClusterRole"
}


# https://docs.aws.amazon.com/eks/latest/userguide/cluster-iam-role.html
resource "aws_iam_role" "eksClusterRole" {
  name = var.cluster_role_name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : [
            "eks.amazonaws.com"
          ]
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eksClusterRole_AmazonEKSClusterPolicy" {
  role       = aws_iam_role.eksClusterRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# output "eksClusterRole_arn" {
#   value = aws_iam_role.eksClusterRole.arn
# }