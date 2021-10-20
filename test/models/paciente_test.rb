require 'test_helper'

class PacienteTest < ActiveSupport::TestCase
  def criarPaciente
    paciente = Paciente.new nomeCompleto: 'Paciente de teste', dataNascimento: '2000-01-01',
                            CPF: '12345678900', email: 'pacientedeteste@gmail.com'
    endereco = Endereco.new CEP: '01020304', cidade: 'Cidade de teste', bairro: 'Bairro de teste',
                            logradouro: 'Logradouro de teste', complemento: 'Complemento', paciente_id: paciente.id
    paciente.enderecos << endereco
    return paciente
  end

  # Cadastro valido
  test 'paciente deve ser salvo' do
    paciente = criarPaciente
    assert paciente.save
  end

  # Cadastro invalido (viola validates de endereco)
  test 'nao deve cadastrar paciente sem endereco' do
    assert_not Paciente.new(nomeCompleto: 'Paciente de teste', dataNascimento: '2000-01-01',
                            CPF: '12345678900', email: 'pacientedeteste@gmail.com').save
  end

  # Edicao invalida (viola validates de nomeCompleto)
  test 'nao deve alterar nome completo para nome invalido' do
    paciente = criarPaciente
    assert_not paciente.update nomeCompleto: 'P', dataNascimento: '2000-01-01',
                               CPF: '12345678900', email: 'pacientedeteste@gmail.com'
  end

  # Edicao invalida (viola validates de CPF)
  test 'nao deve alterar CPF para CPF invalido' do
    paciente = criarPaciente
    assert_not paciente.update nomeCompleto: 'Paciente de teste', dataNascimento: '2000-01-01',
                               CPF: 'abc123', email: 'pacientedeteste@gmail.com'
  end
end
