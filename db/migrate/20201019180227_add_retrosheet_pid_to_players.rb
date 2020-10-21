class AddRetrosheetPidToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :retrosheet_pid, :string
    add_index :players, :retrosheet_pid, unique: true
    add_index :players, :mlb_api_pid, unique: true
  end
end
