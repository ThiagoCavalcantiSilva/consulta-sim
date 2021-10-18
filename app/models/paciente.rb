class Paciente < ApplicationRecord
  has_many :enderecos, dependent: :destroy
  accepts_nested_attributes_for :enderecos, allow_destroy: true, reject_if: :all_blank
  has_many :consultum, :dependent => :delete_all

  validates :nomeCompleto, presence: true, length: {minimum: 10, too_short: "O tamanho minimo deste campo é %{count}  caracteres."}
  validate :validarDataNascimento
  validates :dataNascimento, presence: true
  validates :CPF, presence: true, uniqueness: true, numericality: { only_integer: true }, length: {is: 11}
  validates :email, presence: true, uniqueness: true, length: {minimum: 6, too_short: "O tamanho minimo deste campo é %{count} caracteres.", maximum: 60, too_long: "O tamanho máximo deste campo é %{count} caracteres." }, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :enderecos, presence: true
  def validarDataNascimento
    if dataNascimento.present? && dataNascimento > Date.today
      errors.add(:dataNascimento, "e uma data invalida!")
    end
  end

end
