terraform {
      backend "s3" {
         bucket = "rs07863121991"
         key = "state/terraform.tfstate"
         region = "us-east-1"
      }

}
