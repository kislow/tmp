# Terraform Debug & Fix - Hints

## 🔍 How to Use These Hints

Read one hint at a time. Try to solve it before moving to the next hint.

---

## Hint 1: Identify All the Problems

Look at the broken code and list everything wrong:

<details>
<summary>Click to reveal</summary>

- [ ] Resources in root module (docker_network)
- [ ] Hardcoded values everywhere
- [ ] Duplicated module blocks (app1, app2)
- [ ] Connection string built in 3+ places
- [ ] No sensitive marking on passwords
- [ ] Variables not being used
- [ ] Can't scale without code changes

</details>

---

## Hint 2: Root Module Rules

**Question:** What should exist in the root `main.tf`?

<details>
<summary>Click to reveal</summary>

Root module should ONLY contain:
- `terraform {}` block
- `provider {}` block
- `module {}` blocks (no resources!)
- Maybe `locals {}` for wiring

**Key insight:** Move the `docker_network` resource into a module.

</details>

---

## Hint 3: The Network Problem

**Question:** Where should `docker_network` go?

<details>
<summary>Click to reveal</summary>

Two options:
1. Create a separate `network` module
2. Put it in the `db` module (database owns the network)

**Recommendation:** Put it in the db module - simpler and the network is infrastructure-level.

The network name should be a variable, not hardcoded.

</details>

---

## Hint 4: Database Module Design

**Question:** What should the db module expose?

<details>
<summary>Click to reveal</summary>

The db module needs:

**Inputs (variables.tf):**
- `db_name`
- `db_user`
- `db_password` (sensitive = true)
- `db_port`
- `network_name`

**Outputs (outputs.tf):**
- `connection_string` (sensitive = true)
- `network_name`
- `container_name`

**Resources (main.tf):**
- `docker_network`
- `docker_container` (postgres)

**Locals (main.tf):**
- Build connection string using `local` values

</details>

---

## Hint 5: Connection String Construction

**Question:** Where should the connection string be built?

<details>
<summary>Click to reveal</summary>

**In the db module only!**

```hcl
locals {
  connection_string = "postgresql://${var.db_user}:${var.db_password}@${docker_container.postgres.name}:${var.db_port}/${var.db_name}"
}

output "connection_string" {
  value     = local.connection_string
  sensitive = true
}
```

**Key points:**
- Use `docker_container.postgres.name` (not "localhost")
- Build once, expose via output
- Mark as sensitive

</details>

---

## Hint 6: The for_each Pattern

**Question:** How do you avoid duplicating `module "app1"` and `module "app2"`?

<details>
<summary>Click to reveal</summary>

Use `for_each` with a map:

```hcl
# In variables.tf
variable "apps" {
  type = map(object({
    port = optional(number, 8080)
  }))
  default = {
    app1 = {}
    app2 = {}
  }
}

# In main.tf
module "apps" {
  source   = "./modules/app"
  for_each = var.apps
  
  name   = each.key
  db_url = module.db.connection_string
  port   = each.value.port
}
```

**Key insight:** ONE module block creates MULTIPLE instances.

</details>

---

## Hint 7: Application Module Design

**Question:** What does the app module need?

<details>
<summary>Click to reveal</summary>

**Inputs (variables.tf):**
- `name` (the app instance name)
- `db_url` (connection string from db module)
- `port` (external port for the container)
- `network_name` (to join the database network)

**Resources (main.tf):**
- `docker_container` for the app

**Key change:** App must join the same network as the database!

```hcl
resource "docker_container" "app" {
  name  = var.name
  image = "nginx:alpine"
  
  networks_advanced {
    name = var.network_name
  }
  
  env = [
    "DATABASE_URL=${var.db_url}"
  ]
  
  ports {
    internal = 80
    external = var.port
  }
}
```

</details>

---

## Hint 8: Root Module Wiring

**Question:** How do you connect everything in `main.tf`?

<details>
<summary>Click to reveal</summary>

```hcl
# 1. Create database (which also creates network)
module "db" {
  source = "./modules/db"
  
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
  db_port     = var.db_port
  network_name = var.network_name
}

# 2. Create apps using the database connection
module "apps" {
  source   = "./modules/app"
  for_each = var.apps
  
  name         = each.key
  db_url       = module.db.connection_string
  port         = each.value.port
  network_name = module.db.network_name
}
```

**Key insight:** Apps depend on db outputs, so they're created after.

</details>

---

## Hint 9: Sensitive Values

**Question:** How do you prevent passwords from appearing in output?

<details>
<summary>Click to reveal</summary>

Mark as sensitive in 3 places:

**1. Variable declaration:**
```hcl
variable "db_password" {
  type      = string
  sensitive = true
  default   = "changeme"
}
```

**2. Module output (db module):**
```hcl
output "connection_string" {
  value     = local.connection_string
  sensitive = true
}
```

**3. Root output:**
```hcl
output "database_connection" {
  value     = module.db.connection_string
  sensitive = true
}
```

</details>

---

## Hint 10: Scaling Test

**Question:** How do you verify it scales correctly?

<details>
<summary>Click to reveal</summary>

After fixing everything, you should be able to:

**Add a third app by ONLY changing variables:**

```hcl
variable "apps" {
  default = {
    app1 = { port = 8080 }
    app2 = { port = 8081 }
    app3 = { port = 8082 }  # <- Just add this
  }
}
```

Then run:
```bash
terraform plan
```

You should see: `Plan: 1 to add, 0 to change, 0 to destroy`

**If you had to modify main.tf or any module code, you failed the test.**

</details>



