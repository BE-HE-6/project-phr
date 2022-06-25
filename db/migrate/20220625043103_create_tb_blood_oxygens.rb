class CreateTbBloodOxygens < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_blood_oxygens do |t|

      t.timestamps
    end
  end
end
