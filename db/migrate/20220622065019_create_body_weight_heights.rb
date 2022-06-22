class CreateBodyWeightHeights < ActiveRecord::Migration[7.0]
  def change
    create_table :body_weight_heights do |t|
      t.integer :user_id
      t.float :weight
      t.float :height
      t.text :note
      t.float :bmi_calculation
      t.datetime :date_time

      t.timestamps
    end
  end
end
