class CreateTbLabResults < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_lab_results do |t|
      t.integer :user_id, null: false
      t.integer :lab_result_category_id, null: false
      t.string :lab_name, null: false
      t.text :lab_doc, null: false
      t.string :lab_result_note, null: false

      t.timestamps
    end
  end
end
