variable "shortnameid" {
  type        = string
  description = "Nome curto para identificacao dos recursos"
}

# variable "vpc-1-name" {
#   type = string
# }

variable "allowed-iplist" {
  description = "IPs que tem acesso remoto na infraestrutura"
  type        = set(string)
}