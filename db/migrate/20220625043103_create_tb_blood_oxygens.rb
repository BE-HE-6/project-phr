class CreateTbBloodOxygens < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_blood_oxygens do |t|
      t.string :blood_oxygen, null: false
      t.string :note
      t.datetime :date_time, null: false
      t.integer :user_id, null: false
      t.integer :blood_oxygen_condition_id, null: false

      t.timestamps
    end
  end
end
