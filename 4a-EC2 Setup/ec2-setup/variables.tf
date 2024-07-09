variable "regiao" {
  type        = string
  description = "Região onde a infraestrutura será criada."
}

variable "remote-state-bucket" {
  type        = string
  description = "Bucket name onde está o remote state"
}

variable "magento-public-key" {
  type        = string
  sensitive = true
}

variable "magento-private-key" {
  type        = string
  sensitive = true
}