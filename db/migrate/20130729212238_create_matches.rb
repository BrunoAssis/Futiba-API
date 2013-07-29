class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date
      t.integer :home_team_id
      t.integer :away_team_id

      t.timestamps
    end
  end
end
