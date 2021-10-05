class CreatePacientes < ActiveRecord::Migration[6.1]
  def change
    create_table :pacientes do |t|
      t.string :nomeCompleto
      t.date :dataNascimento
      t.string :CPF
      t.string :email

      t.timestamps
    end
  end
end
