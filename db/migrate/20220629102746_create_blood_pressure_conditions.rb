class CreateBloodPressureConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :blood_pressure_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
