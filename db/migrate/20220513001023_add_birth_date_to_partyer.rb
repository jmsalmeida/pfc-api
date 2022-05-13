class AddBirthDateToPartyer < ActiveRecord::Migration[7.0]
  def change
    add_column :partyers, :birth_date, :date
  end
end
