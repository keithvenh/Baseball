class AddGidpOppToSeasonBattingStats < ActiveRecord::Migration[6.0]
  def change
    add_column :season_batting_stats, :gidp_opp, :integer
  end
end
