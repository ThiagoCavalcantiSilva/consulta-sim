class CreateMedicos < ActiveRecord::Migration[6.1]
  def change
    create_table :medicos do |t|
      t.string :nomeCompleto
      t.date :dataNascimento
      t.string :CPF
      t.string :email
      t.string :especialidade
      t.string :CRM

      t.timestamps
    end
  end
end
