class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :nome
      t.string :email
      t.string :fone

      t.timestamps
    end
  end
end
