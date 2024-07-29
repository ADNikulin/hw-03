locals {
  db = [for instance in yandex_compute_instance.db : {
    id = instance.id,
    name = instance.hostname,
    fqdn = instance.fqdn
  }]
  web = [for instance in yandex_compute_instance.web : {
    id = instance.id,
    name = instance.hostname,
    fqdn = instance.fqdn
  }]
  storage = [for instance in [yandex_compute_instance.storage] : {
    id = instance.id,
    name = instance.hostname,
    fqdn = instance.fqdn
  }]
}

output "all" {
  value = [for instance in concat(local.db, local.web, local.storage) : {
    id = instance.id,
    name = instance.name,
    fqdn = instance.fqdn
  }]
}
