class CreatePartyPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :party_places do |t|
      t.string :name
      t.string :cnpj
      t.string :main_contact
      t.string :phone
      t.string :cellphone
      t.belongs_to :user

      t.timestamps
    end

    add_index :party_places, :cnpj, :unique => true
  end
end
