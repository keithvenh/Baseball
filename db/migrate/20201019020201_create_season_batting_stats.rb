class CreateSeasonBattingStats < ActiveRecord::Migration[6.0]
  def change
    create_table :season_batting_stats do |t|
      t.references :player, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.integer :g
      t.integer :ab
      t.integer :tpa
      t.integer :h
      t.integer :xbh
      t.integer :tb
      t.integer :d
      t.integer :t
      t.integer :hr
      t.integer :bb
      t.integer :ibb
      t.integer :hbp
      t.integer :so
      t.integer :r
      t.integer :rbi
      t.integer :sb
      t.integer :cs
      t.integer :go
      t.integer :gidp
      t.integer :ao
      t.float :go_ao
      t.integer :sac
      t.integer :sf
      t.integer :hgnd
      t.integer :hldr
      t.integer :hpop
      t.integer :hfly
      t.integer :roe
      t.integer :lob
      t.float :avg
      t.float :slg
      t.float :obp
      t.float :ops
      t.float :babip

      t.timestamps
    end
  end
end
