output "remote_state_bucket_name" {
  description = "Name do bucket"
  value = aws_s3_bucket.s3-remote-state.bucket
}

output "remote_state_bucket_arn" {
  description = "Name do bucket"
  value = aws_s3_bucket.s3-remote-state.arn
}

output "regiao" {
  description = "Região onde a infraestrutura será criada."
  value     = var.regiao
}

output "projeto" {  
  description = "Descrição do projeto."
  value       = var.projeto
}

output "cliente" {  
  description = "Cliente do projeto."
  value       = "Cloud Treinamentos"
}

output "autor" {  
  description = "Autor de edição."
  value       = "Bruno Ferreira"
}

output "bucket-remote-state" {  
  description = "Nome do bucket do remote-state."
  value       = "remote-state-magento"
}