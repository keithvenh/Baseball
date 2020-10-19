class AddMlbApiPid < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :mlb_api_pid, :integer
  end
end
