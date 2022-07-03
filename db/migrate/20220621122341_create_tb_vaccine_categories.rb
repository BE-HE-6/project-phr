class CreateTbVaccineCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_vaccine_categories do |t|
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
