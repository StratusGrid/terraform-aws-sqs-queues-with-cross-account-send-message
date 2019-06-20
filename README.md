### Example Usage:
```
module "sqs_queue_cross_account_send" {
  source      = "github.com/StratusGrid/terraform-aws-sqs-queues-with-cross-account-send-message"
  queue_name = "${var.name_prefix}-cross-account-queue${var.name_suffix}"
  allowed_iam_principals = ["arn:aws:iam::111122223333:root"]
  redrive_policy = "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:222233334444:dead-letter-queue\",\"maxReceiveCount\":1}"
  input_tags  = "${merge(local.common_tags,
    map(
    )
  )}"
}

```
