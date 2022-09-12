class AddSessionsToUser < ActiveRecord::Migration[7.0]
  def self.up
    add_column :sessions, :session_id, :integer
    add_index 'sessions', ['session_id'], :name => 'index_session_id'
  end

  def self.down
    remove_column :sessions, :session_id
  end
end
