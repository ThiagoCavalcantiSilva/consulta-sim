class Consultum < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente

  validate :validarData

  def validarData
    if data.present? && data < Date.today
      errors.add(:data, "Data inválida")
    end
  end

  validate :validarHorario
  def validarHorario
    if data.present? && Date.today && horario < Time.current
      errors.add(:horario, "Horainválida ")
    end
  end
end
