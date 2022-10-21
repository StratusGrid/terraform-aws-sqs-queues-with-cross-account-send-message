resource "aws_sqs_queue" "queue" {
  name              = var.queue_name
  kms_master_key_id = aws_kms_key.sqs_message_key
  redrive_policy    = var.redrive_policy
  tags              = merge(local.common_tags, {})
}

resource "aws_kms_key" "sqs_message_key" {
  description             = "KMS key for encryption of SQS messages"
  enable_key_rotation     = true
  deletion_window_in_days = var.kms_log_key_deletion_window
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = "CrossAccountSendMessage"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = var.allowed_iam_principals
    }
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.queue.arn]
  }
}

resource "aws_sqs_queue_policy" "policy" {
  queue_url = aws_sqs_queue.queue.id
  policy    = data.aws_iam_policy_document.policy.json
}
