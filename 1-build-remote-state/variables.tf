variable "regiao" {
  type        = string
  description = "Região onde a infraestrutura será criada."
  default     = "us-east-1"
}

variable "projeto" {
  type        = string
  description = "Descrição do projeto."
  default     = "oficina-19-magento"
}

variable "cliente" {
  type        = string
  description = "Cliente do projeto."
  default     = "Cloud Treinamentos"
}

variable "autor" {
  type        = string
  description = "Autor de edição."
  default     = "Bruno Ferreira"
}

variable "bucket-remote-state" {
  type        = string
  description = "Nome do bucket do remote-state."
  default     = "remote-state-magento"
}