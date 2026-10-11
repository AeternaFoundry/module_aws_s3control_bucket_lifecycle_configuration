variable "s3control_bucket_lifecycle_configurations" {
  description = <<EOT
Map of s3control_bucket_lifecycle_configurations, attributes below
Required:
    - bucket
    - rule (block):
        - abort_incomplete_multipart_upload (optional, block):
            - days_after_initiation (required)
        - expiration (optional, block):
            - date (optional)
            - days (optional)
            - expired_object_delete_marker (optional)
        - filter (optional, block):
            - prefix (optional)
            - tags (optional)
        - id (required)
        - status (optional)
Optional:
    - region
EOT

  type = map(object({
    bucket = string
    region = optional(string)
    rule = list(object({
      abort_incomplete_multipart_upload = optional(object({
        days_after_initiation = number
      }))
      expiration = optional(object({
        date                         = optional(string)
        days                         = optional(number)
        expired_object_delete_marker = optional(bool)
      }))
      filter = optional(object({
        prefix = optional(string)
        tags   = optional(map(string))
      }))
      id     = string
      status = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.s3control_bucket_lifecycle_configurations : (
        length(v.rule) >= 1
      )
    ])
    error_message = "Each rule list must contain at least 1 items"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

