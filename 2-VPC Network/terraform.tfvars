# Regiao onde será criada a infraestrutura
regiao = data.terraform_remote_state.remote-state-information.outputs.regiao

# Nome do projeto
projeto = data.terraform_remote_state.remote-state-information.outputs.projeto

# Nome do cliente que solicitou o projeto
cliente = data.terraform_remote_state.remote-state-information.outputs.cliente

# Autor das edições
autor = data.terraform_remote_state.remote-state-information.outputs.autor

remote-state-bucket = data.terraform_remote_state.remote-state-information.outputs.remote-state-bucket-name