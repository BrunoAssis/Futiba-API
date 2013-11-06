class CreatePlayTypes < ActiveRecord::Migration
  def change
    create_table :play_types do |t|
      t.string :description
      t.boolean :scorable, default: false

      t.timestamps
    end
  end
end
