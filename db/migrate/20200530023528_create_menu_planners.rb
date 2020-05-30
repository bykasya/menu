class CreateMenuPlanners < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_planners do |t|
      t.date :date
      t.integer :dish_type
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
