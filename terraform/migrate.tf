# S3 and DynamoDB resources
moved {
  from = aws_s3_bucket.trailalerts_rules_bucket
  to   = module.trailalerts.module.s3.aws_s3_bucket.trailalerts_rules_bucket
}

moved {
  from = aws_dynamodb_table.security_events[0]
  to   = module.trailalerts.module.dynamodb[0].aws_dynamodb_table.security_events
}

# Lambda function and related resources
moved {
  from = aws_lambda_function.trailalerts_cloudtrail_analyzer
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_lambda_function.trailalerts_cloudtrail_analyzer
}

moved {
  from = aws_lambda_function.trailalerts_event_processor
  to   = module.trailalerts.module.lambda_event_processor.aws_lambda_function.trailalerts_event_processor
}

# IAM roles and policies
moved {
  from = aws_iam_role.trailalerts_cloudtrail_analyzer_role
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_iam_role.trailalerts_cloudtrail_analyzer_role
}

moved {
  from = aws_iam_role.trailalerts_event_processor_role
  to   = module.trailalerts.module.lambda_event_processor.aws_iam_role.trailalerts_event_processor_role
}

moved {
  from = aws_iam_role_policy.trailalerts_cloudtrail_analyzer_policy
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_iam_role_policy.trailalerts_cloudtrail_analyzer_policy
}

moved {
  from = aws_iam_role_policy.trailalerts_cloudtrail_analyzer_sqs_policy
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_iam_role_policy.trailalerts_cloudtrail_analyzer_sqs_policy
}

moved {
  from = aws_iam_role_policy.trailalerts_event_processor_policy
  to   = module.trailalerts.module.lambda_event_processor.aws_iam_role_policy.trailalerts_event_processor_policy
}

moved {
  from = aws_iam_role_policy.trailalerts_event_processor_sqs_policy
  to   = module.trailalerts.module.lambda_event_processor.aws_iam_role_policy.trailalerts_event_processor_sqs_policy
}

# CloudWatch Log Groups
moved {
  from = aws_cloudwatch_log_group.trailalerts_cloudtrail_analyzer_log_group
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_cloudwatch_log_group.trailalerts_cloudtrail_analyzer_log_group
}

moved {
  from = aws_cloudwatch_log_group.trailalerts_event_processor_log_group
  to   = module.trailalerts.module.lambda_event_processor.aws_cloudwatch_log_group.trailalerts_event_processor_log_group
}

# Lambda Layer
moved {
  from = aws_lambda_layer_version.trailalerts_detection_layer
  to   = module.trailalerts.module.lambda_layer.aws_lambda_layer_version.trailalerts_detection_layer
}

# Event Source Mappings and Notifications
moved {
  from = aws_lambda_event_source_mapping.sqs_to_event_processor
  to   = module.trailalerts.module.lambda_event_processor.aws_lambda_event_source_mapping.sqs_to_event_processor
}

moved {
  from = aws_s3_bucket_notification.cloudtrail_logs_notification
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_s3_bucket_notification.cloudtrail_logs_notification
}

moved {
  from = aws_lambda_permission.allow_s3
  to   = module.trailalerts.module.lambda_cloudtrail_analyzer.aws_lambda_permission.allow_s3
}

# SQS Queue
moved {
  from = aws_sqs_queue.trailalerts_alerts_queue
  to   = module.trailalerts.module.sqs.aws_sqs_queue.trailalerts_alerts_queue
}