output "remote_state_bucket_name" {
  description = "Name do bucket"
  value       = aws_s3_bucket.s3-remote-state.bucket
}

output "remote_state_bucket_arn" {
  description = "Name do bucket"
  value       = aws_s3_bucket.s3-remote-state.arn
}

output "regiao" {
  description = "Região onde a infraestrutura será criada."
  value       = var.regiao
}

output "projeto" {
  description = "Descrição do projeto."
  value       = var.projeto
}

output "cliente" {
  description = "Cliente do projeto."
  value       = var.cliente
}

output "autor" {
  description = "Autor de edição."
  value       = var.autor
}

output "shortnameid" {
  description = "Nome curto para identificação dos recursos na AWS"
  value       = var.shortnameid
}