provider "aws" {
region = "us-east-2"
access_key = var.aws_access_kay
secret_key = var.aws_secret_key
}
resource "aws_instance" "count_terraform_test" {
# create four similar EC2 instances
  count = 4
  ami           = "ami-097a2df4ac947655f"
  instance_type = "t2.micro"

  tags = {
    # Usage of count.index in providing a distinct name for every Instance
    Name = "Server ${count.index}"
  }
}

output "instance_id" {
  # Select all instance id using * in place of index value
  value = aws_instance.count_terraform_test[*].id
}

