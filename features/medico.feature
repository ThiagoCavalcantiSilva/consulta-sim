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