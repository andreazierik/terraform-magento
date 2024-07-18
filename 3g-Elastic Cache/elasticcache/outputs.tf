output "elasticcache-1-cluster-address" {
  value = aws_elasticache_cluster.elasticcache-1.cluster_address
}

output "elasticcache-1-configuration-endpoint" {
  value = "${aws_elasticache_cluster.elasticcache-1.configuration_endpoint}"
}

output "elasticcache-1-cluster-id" {
  value = "${aws_elasticache_cluster.elasticcache-1.cluster_id}"
}
