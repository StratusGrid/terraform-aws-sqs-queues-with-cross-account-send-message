variable "queue_name" {
  description = "Name of queue being created"
  type        = string
}

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default = {
    Developer   = "StratusGrid"
    Provisioner = "Terraform"
  }
}

variable "allowed_iam_principals" {
  description = "IAM Principals allowed to SendMessage on the created queue"
  type        = list(string)
}

variable "redrive_policy" {
  description = "Redrive policy for queue"
  type        = string
}

variable "kms_log_key_deletion_window" {
  description = "Duration (in day) of kms key created, default is 30"
  type        = number
}
