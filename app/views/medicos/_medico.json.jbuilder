json.extract! medico, :id, :nomeCompleto, :dataNascimento, :CPF, :email, :especialidade, :CRM, :created_at, :updated_at
json.url medico_url(medico, format: :json)
