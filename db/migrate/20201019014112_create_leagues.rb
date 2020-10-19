class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.string :title
      t.string :abbr

      t.timestamps
    end
  end
end
