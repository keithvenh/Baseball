class CreateSubLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_leagues do |t|
      t.string :title
      t.string :abbr
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
