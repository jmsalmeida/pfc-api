class AddDefaultValueToSessionStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :sessions, :status, :boolean, default: true
  end
end
