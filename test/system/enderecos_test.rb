require "application_system_test_case"

class EnderecosTest < ApplicationSystemTestCase
  setup do
    @endereco = enderecos(:one)
  end

  test "visiting the index" do
    visit enderecos_url
    assert_selector "h1", text: "Enderecos"
  end

  test "creating a Endereco" do
    visit enderecos_url
    click_on "New Endereco"

    fill_in "Cep", with: @endereco.CEP
    fill_in "Bairro", with: @endereco.bairro
    fill_in "Cidade", with: @endereco.cidade
    fill_in "Complemento", with: @endereco.complemento
    fill_in "Logradouro", with: @endereco.logradouro
    fill_in "Paciente", with: @endereco.paciente_id
    click_on "Create Endereco"

    assert_text "Endereco was successfully created"
    click_on "Back"
  end

  test "updating a Endereco" do
    visit enderecos_url
    click_on "Edit", match: :first

    fill_in "Cep", with: @endereco.CEP
    fill_in "Bairro", with: @endereco.bairro
    fill_in "Cidade", with: @endereco.cidade
    fill_in "Complemento", with: @endereco.complemento
    fill_in "Logradouro", with: @endereco.logradouro
    fill_in "Paciente", with: @endereco.paciente_id
    click_on "Update Endereco"

    assert_text "Endereco was successfully updated"
    click_on "Back"
  end

  test "destroying a Endereco" do
    visit enderecos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Endereco was successfully destroyed"
  end
end
