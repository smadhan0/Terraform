provider "aws" {
region = "us-east-1"

# You can export the key thru cmd line using the cmd instead of using it here.. 

# export AWS_ACCESS_KEY_ID=AKIAWI4DOLHUOXYNF7FW
# export AWS_SECRET_ACCESS_KEY=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

access_key = "AKIAWI4DOLHUOXYNF7FW"
secret_key = "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"

}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = var.my_bucket_name
  } 

  resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

