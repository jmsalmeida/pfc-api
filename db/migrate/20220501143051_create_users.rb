class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :user_type, null: false
      t.timestamps null: false
    end

    add_index :users, :email, :unique => true
  end
end
