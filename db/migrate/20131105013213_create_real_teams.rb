class CreateRealTeams < ActiveRecord::Migration
  def change
    create_table :real_teams do |t|
      t.string :name
      t.string :fun_name
      t.string :main_color
      t.string :secondary_color
      t.string :third_color

      t.timestamps
    end
  end
end
