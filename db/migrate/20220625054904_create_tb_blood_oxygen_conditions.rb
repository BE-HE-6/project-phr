class CreateTbBloodOxygenConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_blood_oxygen_conditions do |t|
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
