# resource "aws_s3_bucket" "state-file-bucket" {
resource "aws_s3_bucket" "terrastate-stage" {

  bucket = "${var.environment}-state-file"

  versioning {
    enabled = true
  }

  # tags {
  #   environment = "${var.environment}"
  # }
}
