terraform {
  backend "s3" {
    bucket  = "emirates-devsecops-tfstate"
    key     = "eks/terraform.tfstate"
    region  = "me-central-1"
    encrypt = true
  }
}
