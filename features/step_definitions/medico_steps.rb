Given('estou na pagina de edicao de medico') do
  visit '/medicos'
  expect(page).to have_current_path('/medicos')
  click_link 'Cadastrar médico'
  fill_in 'medico[nomeCompleto]', :with => 'Mauro Torres'
  fill_in 'medico[dataNascimento]', :with => '1983-08-31'
  fill_in 'medico[CPF]', :with => '19937452032'
  fill_in 'medico[email]', :with => 'maurotorres@gmail.com'
  fill_in 'medico[especialidade]', :with => 'Gastro'
  fill_in 'medico[CRM]', :with => '11223'
  click_button 'Concluir'
  click_link 'Voltar'
  click_link 'Editar'
end
Given('vejo medico com nome {string} e CRM {string}') do |string, string2|
  page.has_content?(string)
  page.has_content?(string2)
end

When('eu altero a especialidade para {string}') do |string|
  fill_in 'medico[especialidade]', :with => string
end
When('clico em concluir') do
  click_button 'Concluir'
end

Then('eu vejo uma mensagem que o medico foi atualizado com sucesso') do
  expect(page).to have_content('Médico atualizado com sucesso.')
end

Given('estou na pagina de medico') do
  visit '/medicos'
  expect(page).to have_current_path('/medicos')
end
Given('o medico com CRM {string} existe') do |string|
  click_link 'Cadastrar médico'
  fill_in 'medico[nomeCompleto]', :with => 'Mauro Torres'
  fill_in 'medico[dataNascimento]', :with => '1983-08-31'
  fill_in 'medico[CPF]', :with => '19937452032'
  fill_in 'medico[email]', :with => 'maurotorres@gmail.com'
  fill_in 'medico[especialidade]', :with => 'Gastro'
  fill_in 'medico[CRM]', :with => '11223'
  click_button 'Concluir'
  click_link 'Voltar'
  page.has_content?(string)
end

When('eu clico em remover o medico com CRM {string}') do |string|
  expect(page).to have_content('11223')
  click_link "a-#{string}"
end

Then('eu vejo uma mensagem que o medico foi apagado com sucesso') do
  expect(page).to have_content('Médico apagado com sucesso.')
end

When('altero o CRM para {string}') do |string|
  fill_in 'medico[CRM]', :with => string
end

Then('eu vejo uma mensagem de CRM com tamanho errado') do
  expect(page).to have_content("Crm is the wrong length (should be 5 characters)")
  #assert_selector('div#error_explanation', text:'')
end