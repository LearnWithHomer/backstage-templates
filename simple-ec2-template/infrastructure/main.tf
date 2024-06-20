
# main.tf

# Define the Terraform provider
provider "random" {
  # Configuration options (if any) can go here
}

# Generate a random string
resource "random_string" "example" {
  length  = 16
  special = true
}

# Generate a random integer
resource "random_integer" "example" {
  min = 1
  max = 100
}

# Generate a random pet name
resource "random_pet" "example" {
  length = 3
}

# Output the random values
output "random_string" {
  value = random_string.example.result
}

output "random_integer" {
  value = random_integer.example.result
}

output "random_pet_name" {
  value = random_pet.example.id
}
