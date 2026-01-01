terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# ❌ RESOURCE IN ROOT (NOT ALLOWED)
resource "docker_network" "app_net" {
  name = "app_network"
}

# ❌ DUPLICATED MODULE BLOCKS
module "db" {
  source = "./modules/db"
  db_name = "users"
  port    = 5432
}

module "app1" {
  source = "./modules/app"
  name   = "app1"
  db_url = "postgresql://user:password@localhost:5432/users"
}

module "app2" {
  source = "./modules/app"
  name   = "app2"
  db_url = "postgresql://user:password@localhost:5432/users"
}
