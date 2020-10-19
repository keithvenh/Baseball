class CreateDivisions < ActiveRecord::Migration[6.0]
  def change
    create_table :divisions do |t|
      t.string :title
      t.string :abbr
      t.references :sub_league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
