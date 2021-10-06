class Consultum < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente

  validate :validarData

  def validarData
    if data.present? && data <= Date.today
      errors.add(:data, "Data inválida - Marque consultas a partir de amanhã")
    end
  end
end
