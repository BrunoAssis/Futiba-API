class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :number
      t.string :position
      t.integer :offense
      t.integer :defense
      t.integer :stamina
      t.references :real_team, index: true

      t.timestamps
    end
  end
end
