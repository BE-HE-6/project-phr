class CreateTbLabMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_lab_measurements do |t|

      t.string :name, null: false, index: { unique: true }
      
      t.timestamps
    end
  end
end
