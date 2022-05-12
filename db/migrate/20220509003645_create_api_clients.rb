class CreateApiClients < ActiveRecord::Migration[7.0]
  def change
    create_table :api_clients do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.boolean :domain_service, null: false

      t.timestamps
    end

    add_index :api_clients, :name, unique: true
    add_index :api_clients, :token, unique: true
  end
end
