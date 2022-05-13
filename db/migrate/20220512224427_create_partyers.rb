class CreatePartyers < ActiveRecord::Migration[7.0]
  def change
    create_table :partyers do |t|
      t.string :name
      t.string :gender
      t.belongs_to :user

      t.timestamps
    end
  end
end
