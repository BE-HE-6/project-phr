class CreateTbJoinLabMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_join_lab_measurements do |t|
      t.string :value, null: false
      t.integer :measurement_id, null: false
      t.integer :result_id, null: false
      t.timestamps
    end
  end
end
