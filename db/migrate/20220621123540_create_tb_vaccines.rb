class CreateTbVaccines < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_vaccines do |t|
      t.integer :user_id, null: false
      t.integer :vaccine_category_id, null: false
      t.string :name, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
