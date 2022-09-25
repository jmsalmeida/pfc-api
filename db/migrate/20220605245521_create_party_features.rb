class CreatePartyFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :party_features do |t|
      t.boolean :completed, default: false
      t.boolean :smoke_place, default: false
      t.boolean :available_tables, default: false
      t.references :party_place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
