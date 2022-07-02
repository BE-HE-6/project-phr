class CreateTbJoinLabMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_join_lab_measurements do |t|
      t.integer :lab_measurement_id, null: false
      t.integer :lab_result_id, null: false
      t.integer :lab_result_tb_user_id, null: false
      t.integer :lab_result_tb_lab_result_category_id, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
