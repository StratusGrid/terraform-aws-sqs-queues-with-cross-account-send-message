<!-- BEGIN_TF_DOCS -->
# terraform-aws-sqs-queues-with-cross-account-send-message

GitHub: [StratusGrid/terraform-aws-sqs-queues-with-cross-account-send-message](https://github.com/StratusGrid/terraform-aws-sqs-queues-with-cross-account-send-message)

This module allows the creation of a queue which will allow messages to be sent to the queue from a list of IAM Principals. Generally used to add permissions to the SQS queue for other AWS accounts to submit messages.

## Example Usage:
```hcl
module "sqs_queue_cross_account_send" {
  source = "StratusGrid/sqs-queues-with-cross-account-send-message/aws"
  version = "1.1.0"

  queue_name = "${var.name_prefix}-cross-account-queue${var.name_suffix}"
  allowed_iam_principals = ["arn:aws:iam::111122223333:root"]
  redrive_policy = "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:222233334444:dead-letter-queue\",\"maxReceiveCount\":1}"

  input_tags  = merge(local.common_tags, {})
}
```
---

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.sqs_message_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sqs_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_iam_principals"></a> [allowed\_iam\_principals](#input\_allowed\_iam\_principals) | IAM Principals allowed to SendMessage on the created queue | `list(string)` | n/a | yes |
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | <pre>{<br>  "Developer": "StratusGrid",<br>  "Provisioner": "Terraform"<br>}</pre> | no |
| <a name="input_kms_log_key_deletion_window"></a> [kms\_log\_key\_deletion\_window](#input\_kms\_log\_key\_deletion\_window) | Duration (in day) of kms key created, default is 30 | `number` | n/a | yes |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Name of queue being created | `string` | n/a | yes |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | Redrive policy for queue | `string` | n/a | yes |

## Outputs

No outputs.

---

<span style="color:red">Note:</span> Manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->