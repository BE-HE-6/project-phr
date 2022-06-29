class CreateBloodPressures < ActiveRecord::Migration[7.0]
  def change
    create_table :blood_pressures do |t|
      t.integer :user_id
      t.integer :blood_pressure_condition_id
      t.integer :sistole
      t.integer :diastole
      t.integer :pulse
      t.text :note
      t.datetime :date_time

      t.timestamps
    end
  end
end
