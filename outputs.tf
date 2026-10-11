output "s3control_bucket_lifecycle_configurations_id" {
  description = "Map of id values across all s3control_bucket_lifecycle_configurations, keyed the same as var.s3control_bucket_lifecycle_configurations"
  value       = { for k, v in aws_s3control_bucket_lifecycle_configuration.s3control_bucket_lifecycle_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3control_bucket_lifecycle_configurations_bucket" {
  description = "Map of bucket values across all s3control_bucket_lifecycle_configurations, keyed the same as var.s3control_bucket_lifecycle_configurations"
  value       = { for k, v in aws_s3control_bucket_lifecycle_configuration.s3control_bucket_lifecycle_configurations : k => v.bucket if v.bucket != null && length(v.bucket) > 0 }
}
output "s3control_bucket_lifecycle_configurations_region" {
  description = "Map of region values across all s3control_bucket_lifecycle_configurations, keyed the same as var.s3control_bucket_lifecycle_configurations"
  value       = { for k, v in aws_s3control_bucket_lifecycle_configuration.s3control_bucket_lifecycle_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "s3control_bucket_lifecycle_configurations_rule" {
  description = "Map of rule values across all s3control_bucket_lifecycle_configurations, keyed the same as var.s3control_bucket_lifecycle_configurations"
  value       = { for k, v in aws_s3control_bucket_lifecycle_configuration.s3control_bucket_lifecycle_configurations : k => v.rule if v.rule != null && length(v.rule) > 0 }
}

