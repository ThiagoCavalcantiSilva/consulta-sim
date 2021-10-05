json.extract! paciente, :id, :nomeCompleto, :dataNascimento, :CPF, :email, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
