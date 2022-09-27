class CreatePartyers < ActiveRecord::Migration[7.0]
  def change
    create_table :partyers do |t|
      t.string :name
      t.string :gender
      t.date :birth_date
      t.belongs_to :user
      t.references :checkins

      t.timestamps
    end
  end
end
