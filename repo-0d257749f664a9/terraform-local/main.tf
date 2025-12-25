module "app" {
  source   = "git::https://github.com/kislow/tmp.git//repo-0d257749f664a9/terraform-local/modules/app?ref=unais-tf"

  name     = "example"
  internal_port = 5432
  image          = "example"
  external_port  = "example"
  database_url   = module.databases[each.value.db].connection_string

}

module "postgres" {
  source = "git::https://github.com/kislow/tmp.git//repo-0d257749f664a9/terraform-local/modules/postgres?ref=unais-tf"

  name     = "example"
  db_name  = "example"
  user     = "example"
  password = "example"
  port     = 5432
}