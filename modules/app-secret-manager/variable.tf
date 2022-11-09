variable "env" {
  type = string
}

variable "application" {
  type = string
}

variable "secret_policy" {
  type        = any
  description = "Map of IAM policy statements to use in the policy."
  default = {}
}

variable "app_policy" {
  type        = any
  description = "Map of IAM policy statements to use in the policy."
  default = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "kafka-cluster:Connect",
          "kafka-cluster:DescribeTopic",
          "kafka-cluster:DescribeGroup",
          "kafka-cluster:AlterGroup",
          "kafka-cluster:ReadData",
          "kafka-cluster:WriteData",
          "kafka-cluster:AlterTopic",
          "kafka-cluster:CreateTopic",
          "kafka-cluster:DeleteTopic",
          "kafka-cluster:DescribeTopicDynamicConfiguration"
        ],
        Resource = [
          "arn:aws:kafka:us-east-1:628275657034:cluster/stage-msk-cluster/fc64874d-48d1-46f0-88ff-4cbc0d3bda2b-9",
          "arn:aws:kafka:us-east-1:628275657034:topic/stage-msk-cluster/fc64874d-48d1-46f0-88ff-4cbc0d3bda2b-9/*",
          "arn:aws:kafka:us-east-1:628275657034:group/stage-msk-cluster/fc64874d-48d1-46f0-88ff-4cbc0d3bda2b-9/*"
        ]
      }
    ]
  }
}

variable "secret_name" {
  type = string
  default = "app/secret"
}