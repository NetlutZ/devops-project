data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
  filter {
    name = "availability-zone"
    values = [
      "${var.aws_region}a",
      "${var.aws_region}b",
      "${var.aws_region}c",
    ]
  }
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eksClusterRole.arn

  vpc_config {
    subnet_ids = data.aws_subnets.public.ids
  }

  access_config {
    authentication_mode                         = "CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }
}
