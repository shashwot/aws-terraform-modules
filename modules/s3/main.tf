resource "aws_kms_key" "mykey" {
  count                   = var.kms_encryption_enabled ? 1 : 0
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "s3_buckets" {
  count                   = length(var.bucket_name)
  bucket                  = var.bucket_name[count.index]
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  count                     = length(var.bucket_name)
  bucket                    = aws_s3_bucket.s3_buckets[count.index].id
  acl                       = var.acl_type
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  count                     = length(var.bucket_name)
  bucket                    = aws_s3_bucket.s3_buckets[count.index].id

  block_public_acls         = var.block_public_acls
  block_public_policy       = var.block_public_policy
  ignore_public_acls        = var.ignore_public_acls
  restrict_public_buckets   = var.restrict_public_buckets
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count                     = length(var.bucket_name)
  bucket                    = aws_s3_bucket.s3_buckets[count.index].id
  versioning_configuration {
    status                  = var.versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server-side-encryption" {
  count                     = length(var.bucket_name)
  bucket                    = aws_s3_bucket.s3_buckets[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey[0].arn
      sse_algorithm     = "aws:kms"
    }
  }
}
