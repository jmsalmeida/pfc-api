class RenameGenderFromPartyer < ActiveRecord::Migration[7.0]
  def change
    rename_column :partyers, :gender, :sex
  end
end
