terraform {
      backend "s3" {
         bucket = "rs7863121991"
         key = "state/terraform.tfstate"
         region = "us-east-1"
      }

}
