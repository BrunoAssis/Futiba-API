class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :player, index: true
      t.references :team, index: true
      t.integer :salary
      
      t.timestamps
    end
  end
end
