class Medico < ApplicationRecord
  has_many :consultum, :dependent => :delete_all

  validates :nomeCompleto, presence: true, length: {minimum: 10, too_short: "O tamanho mínimo deste campo é %{count}  caracteres."}
  validate :validarDataNascimento
  validates :dataNascimento, presence: true
  validates :CPF, length: {is: 11}, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :email, presence: true, length: {minimum: 6, too_short: "O tamanho mínimo deste campo é %{count}  caracteres."}, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :especialidade, presence: true, length: {minimum: 6, too_short: "O tamanho minimo deste campo é %{count} caracteres.", maximum: 60, too_long: "O tamanho máximo deste campo é %{count} caracteres." }
  validates :CRM, presence: true, uniqueness: true, length: {is: 5}

  def validarDataNascimento
    if dataNascimento.present? && dataNascimento > Date.today
      errors.add(:data_nascimento, "é uma data invalida")
    end
  end

end
