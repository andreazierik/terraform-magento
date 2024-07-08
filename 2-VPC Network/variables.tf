variable "projeto" {
  type        = string
  description = "Descrição do projeto."
  default = data.terraform_remote_state.remote-state-information.outputs.projeto
}

variable "cliente" {
  type        = string
  description = "Cliente do projeto."
  default = data.terraform_remote_state.remote-state-information.outputs.cliente
}

variable "autor" {
  type        = string
  description = "Autor de edição."
  default = data.terraform_remote_state.remote-state-information.outputs.autor
}

variable "regiao" {
  type        = string
  description = "Região onde a infraestrutura será criada."
  default = data.terraform_remote_state.remote-state-information.outputs.regiao
}

variable "remote-state-bucket" {
  type        = string
  description = "Bucket name onde está o remote state"
  default = data.terraform_remote_state.remote-state-information.outputs.remote-state-bucket-name
}