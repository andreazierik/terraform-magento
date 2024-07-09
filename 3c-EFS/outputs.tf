output "efs-1-endpoint" {
  description = "Endpoint do filesystem para montar /etc/opt"
  value       = module.efs.fs-efs-1-dns
}