terraform {
  # OpenTofu's first stable release is 1.6
  required_version = ">= 1.6.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.11"
    }
  }
}

resource "random_pet" "this" {
  length = var.pet_length
}

resource "random_integer" "this" {
  min = 1
  max = 100
}

resource "random_password" "this" {
  length  = 16
  special = false
}

resource "time_static" "this" {}

resource "null_resource" "hello" {
  triggers = {
    pet = random_pet.this.id
  }

  provisioner "local-exec" {
    command = "echo Hello from IACM, ${random_pet.this.id}!"
  }
}
