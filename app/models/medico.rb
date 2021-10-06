class Medico < ApplicationRecord
  has_many :consultum, :dependent => :delete_all
end
