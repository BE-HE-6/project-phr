class CreateTbBloodGlucoses < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_blood_glucoses do |t|
      t.string :blood_glucose, null: false
      t.string :note
      t.datetime :date_time, null: false
      t.integer :user_id, null: false
      t.integer :blood_glucose_condition_id, null: false

      t.timestamps
    end
  end
end
