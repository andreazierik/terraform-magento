output "elasticcache-elasticcache-1-cluster-address" {
  description = "value"
  value = module.elasticcache.elasticcache-1-cluster-address
}

output "elasticcache-elasticcache-1-configuration-endpoint" {
  description = "value"
  value = "${module.elasticcache.elasticcache-1-configuration-endpoint}"
}

output "elasticcache-elasticcache-1-cluster-id" {
  value = "${module.elasticcache.elasticcache-1-cluster-id}"
}

output "elasticcache-1-teste-x" {
  value = module.elasticcache.elasticcache-1.elasticcache-1-teste
}
