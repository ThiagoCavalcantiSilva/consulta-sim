class Endereco < ApplicationRecord
  belongs_to :paciente

  validates :CEP, presence: true, numericality: { only_integer: true }, length: {is: 8}
  validates :cidade, presence: true, length: {minimum: 2, too_short: "O tamanho minimo deste campo é %{count} caracteres", maximum:20, too_long: "O tamanho máximo deste campo é %{count} caracteres" }
  validates :bairro, presence: true, length: {minimum: 3, too_short: "O tamanho minimo deste campo é %{count} caracteres ", maximum:50, too_long: "O tamanho máximo deste campo é %{count} caracteres" }
  validates :logradouro, presence: true, length: {minimum: 3, too_short: "O tamanho minimo deste campo é %{count} caracteres ", maximum:50, too_long: "O tamanho máximo deste campo é %{count} caracteres" }
  validates :complemento, length: {maximum:50, too_long: "O tamanho máximo deste campo é %{count} caracteres" }
end
