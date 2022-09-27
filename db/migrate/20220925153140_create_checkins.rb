class CreateCheckins < ActiveRecord::Migration[7.0]
  def change
    create_table :checkins do |t|
      t.belongs_to :partyer
      t.belongs_to :party_place

      t.timestamps
    end
  end
end
