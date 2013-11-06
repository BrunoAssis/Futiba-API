class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :match, index: true
      t.string :period
      t.integer :minute
      t.references :play_type, index: true
      t.string :involved

      t.timestamps
    end
  end
end
