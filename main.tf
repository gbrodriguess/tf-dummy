terraform {
  # OpenTofu's first stable release is 1.6
  required_version = ">= 1.6.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.50"
    }
  }
}

provider "databricks" {}


resource "databricks_directory" "demo" {
  path = "/Shared/terraform-demo"
}

# A secret scope
resource "databricks_secret_scope" "demo" {
  name = "terraform-demo"
}

resource "databricks_notebook" "hello" {
  path     = "${databricks_directory.demo.path}/hello"
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    # Databricks notebook source
    print("Hello from Terraform")
  EOT
  )
}

