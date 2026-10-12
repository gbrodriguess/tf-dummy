output "pet_name" {
  value = random_pet.this.id
}

output "random_number" {
  value = random_integer.this.result
}

output "created_at" {
  value = time_static.this.rfc3339
}

output "password" {
  value     = random_password.this.result
  sensitive = true
}
