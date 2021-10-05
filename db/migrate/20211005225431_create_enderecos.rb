class CreateEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :CEP
      t.string :cidade
      t.string :bairro
      t.text :logradouro
      t.text :complemento
      t.belongs_to :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
