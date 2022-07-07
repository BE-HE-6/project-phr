class CreateTbLabResults < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_lab_results do |t|
      t.string :name
      t.datetime :date_time
      t.string :doc
      t.string :result_note
      t.integer :result_category_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
