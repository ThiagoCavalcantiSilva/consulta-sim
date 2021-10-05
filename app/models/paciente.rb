class Paciente < ApplicationRecord
  has_many :enderecos, dependent: :destroy
  accepts_nested_attributes_for :enderecos, allow_destroy: true, reject_if: :all_blank
end
