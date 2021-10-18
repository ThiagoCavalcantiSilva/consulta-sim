require 'test_helper'

class ConsultumTest < ActiveSupport::TestCase
  def criarConsulta
    paciente = Paciente.new nomeCompleto: 'Paciente de teste', dataNascimento: '2000-01-01',
                            CPF: '12345678900', email: 'pacientedeteste@gmail.com'
    endereco = Endereco.new CEP: '01020304', cidade: 'Cidade de teste', bairro: 'Bairro de teste',
                            logradouro: 'Logradouro de teste', complemento: 'Complemento', paciente_id: paciente.id
    paciente.enderecos << endereco
    paciente.save

    medico = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678900',
                        email: 'medicodeteste@gmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
    medico.save

    consulta = Consultum.new data: '2021-12-12', horario: '10:00', medico_id: medico.id, paciente_id: paciente.id
  end

  # Cadastro valido
  test 'consulta deve ser salva' do
    consulta = criarConsulta
    assert consulta.save
  end

  # Cadastro invalido (viola validates de paciente)
  test 'nao deve cadastrar consulta sem paciente' do
    paciente = Paciente.new nomeCompleto: 'Paciente de teste', dataNascimento: '2000-01-01',
                            CPF: '12345678900', email: 'pacientedetestegmail.com'
    endereco = Endereco.new CEP: '01020304', cidade: 'Cidade de teste', bairro: 'Bairro de teste',
                            logradouro: 'Logradouro de teste', complemento: 'Complemento', paciente_id: paciente.id
    paciente.enderecos << endereco
    paciente.save

    medico = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678900',
                        email: 'medicodetestegmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
    medico.save

    consulta = Consultum.new data: '2021-12-12', horario: '10:00', medico_id: medico.id
    assert_not consulta.save
  end

  # Edicao invalida (viola validates de data)
  test 'nao deve alterar data para data invalida' do
    paciente = Paciente.new nomeCompleto: 'Paciente de teste', dataNascimento: '2000-01-01',
                            CPF: '12345678900', email: 'pacientedeteste@gmail.com'
    endereco = Endereco.new CEP: '01020304', cidade: 'Cidade de teste', bairro: 'Bairro de teste',
                            logradouro: 'Logradouro de teste', complemento: 'Complemento', paciente_id: paciente.id
    paciente.enderecos << endereco
    paciente.save

    medico = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678900',
                        email: 'medicodeteste@gmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
    medico.save

    consulta = Consultum.new data: '2021-12-12', horario: '10:00', medico_id: medico.id, paciente_id: paciente.id
    assert_not consulta.update data: '2000-01-01', horario: '10:00', medico_id: medico.id, paciente_id: paciente.id
  end

  # Remocao
  test 'consulta deve ser removida' do
    consulta = criarConsulta
    assert consulta.delete
  end

  end