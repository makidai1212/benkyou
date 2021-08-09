class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :goal
      t.string :step_1
      t.string :step_2
      t.string :step_3
      t.string :step_4
      t.string :step_5
      t.string :step_6

      t.timestamps
    end
  end
end
