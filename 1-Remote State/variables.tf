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

variable "regiao" {
  type        = string
  description = "Região onde a infraestrutura será criada."  
}

variable "remote-state-bucket" {
  type        = string
  description = "Bucket name onde está o remote state"
}