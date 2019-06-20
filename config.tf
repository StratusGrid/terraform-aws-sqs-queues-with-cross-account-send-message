resource "aws_sqs_queue" "queue" {
  name = "${var.queue_name}"
  redrive_policy = "${var.redrive_policy}"
  tags = "${merge(var.input_tags,
    map(
    )
  )}"
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid = "CrossAccountSendMessage"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = "${var.allowed_iam_principals}"
    }
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      "${aws_sqs_queue.queue.arn}"
    ]
  }
}

resource "aws_sqs_queue_policy" "policy" {
  queue_url = "${aws_sqs_queue.queue.id}"

  policy = "${data.aws_iam_policy_document.policy.json}"
}
