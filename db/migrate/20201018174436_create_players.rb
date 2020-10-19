class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :fname
      t.string :lname
      t.string :bats
      t.string :throws

      t.timestamps
    end
  end
end
