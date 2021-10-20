Feature: Medico
  As a medico
  I want to adicionar, remover, visualizar e editar meu cadastro
  So that eu nao tenha que fazer isso de forma manual ou presencial

  # Positivo
  Scenario: editar medico existente
    Given estou na pagina de edicao de medico
    And vejo medico com nome 'Mauro Torres' e CRM '11223'
    When eu altero a especialidade para 'Gastroenterologista'
    And clico em concluir
    Then eu vejo uma mensagem que o medico foi atualizado com sucesso

  # Positivo
  Scenario: remover medico
    Given estou na pagina de medico
    And o medico com CRM '11223' existe
    When eu clico em remover o medico com CRM '11223'
    Then eu vejo uma mensagem que o medico foi apagado com sucesso

  # Negativo
  Scenario: editar medico inserindo CRM invalido
    Given estou na pagina de edicao de medico
    When altero o CRM para '123456789'
    And clico em concluir
    Then eu vejo uma mensagem de CRM com tamanho errado
