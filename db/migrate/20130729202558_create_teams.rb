class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, :null => false
      t.integer :user_id, :null => false
      t.string :coat_of_arms
      t.integer :money, :default => 1000

      t.timestamps
    end
  end
end