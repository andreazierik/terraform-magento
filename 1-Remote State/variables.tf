variable "projeto" {
  type        = string
  description = "Descrição do projeto."
}

variable "cliente" {
  type        = string
  description = "Cliente do projeto."
}

variable "autor" {
  type        = string
  description = "Autor de edição."
}

variable "shortnameid" {
  type        = string
  description = "Nome curto para identificação dos recursos na AWS"
}

variable "regiao" {
  type        = string
  description = "Região onde a infraestrutura será criada."
}

variable "remote-state-bucket" {
  type        = string
  description = "Bucket name onde está o remote state"
}