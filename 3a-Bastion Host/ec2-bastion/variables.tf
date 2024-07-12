variable "regiao" {
  type        = string
  description = "Região onde a infraestrutura será criada."
}

variable "remote-state-bucket" {
  type        = string
  description = "Bucket name onde está o remote state"
}

variable "shortnameid" {
  type        = string
  description = "Nome curto para identificacao dos recursos"
}

variable "AWS_SSH_PRIVATE_KEY" {
  description = "Chave privada SSH para conexão"
  type        = string
  sensitive   = true
}