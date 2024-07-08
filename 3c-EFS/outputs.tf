output "efs-odoo-endpoint" {
  description = "Endpoint do filesystem para montar /etc/opt"
  value       = module.efs.fs-efs-1-dns
}