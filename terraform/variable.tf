variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
  default     = "my-eks-cluster"
}

variable "node_role_name" {
  type        = string
  description = "Name of node role"
  default     = "eksWorkerNodeRole"
}

variable "node_group_desired_capacity" {
  type        = number
  description = "Desired capacity of Node Group ASG."
  default     = 3
}
variable "node_group_max_size" {
  type        = number
  description = "Maximum size of Node Group ASG. Set to at least 1 greater than node_group_desired_capacity."
  default     = 4
}

variable "node_group_min_size" {
  type        = number
  description = "Minimum size of Node Group ASG."
  default     = 1
}

variable "additional_policy_name" {
  type        = string
  description = "Name of IAM::Policy created for additional permissions"
  default     = "eksPolicy"
}

variable "ecr_repositories" {
  type = list(string)
  default = [
    "boutique/adservice",
    "boutique/cartservice",
    "boutique/checkoutservice",
    "boutique/currencyservice",
    "boutique/emailservice",
    "boutique/frontend",
    "boutique/loadgenerator",
    "boutique/paymentservice",
    "boutique/productcatalogservice",
    "boutique/recommendationservice",
    "boutique/shippingservice"
  ]
}
