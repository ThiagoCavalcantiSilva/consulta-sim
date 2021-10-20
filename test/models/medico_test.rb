require 'test_helper'

class MedicoTest < ActiveSupport::TestCase
  # Cadastro valido
  test 'medico deve ser salvo' do
    medico = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678910',
                        email: 'medicodeteste@gmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
    assert medico.save
  end

  # Cadastro invalido (viola validates de email)
  test 'nao deve cadastrar medico sem email' do
    medico  = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678910',
                         email: '', especialidade: 'Nome da especialidade', CRM: '12345'
    assert_not medico.save
  end

  # Edicao invalida (viola validates de dataNascimento)
  test 'nao deve alterar data de nascimento para data invalida' do
    medico = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678910',
                        email: 'medicodeteste@gmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
    medico.save
    assert_not medico.update nomeCompleto: 'Medico de teste', dataNascimento: '2050-01-01', CPF: '12345678910',
                             email: 'pacientedetestegmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
  end

  # Edicao invalida (viola validates de CRM)
  test 'nao deve alterar CRM para CRM invalido' do
    medico = Medico.new nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678910',
                        email: 'medicodeteste@gmail.com', especialidade: 'Nome da especialidade', CRM: '12345'
    medico.save
    assert_not medico.update nomeCompleto: 'Medico de teste', dataNascimento: '2000-01-01', CPF: '12345678910',
                             email: 'medicodeteste@gmail.com', especialidade: 'Nome da especialidade', CRM: '1'
  end
end