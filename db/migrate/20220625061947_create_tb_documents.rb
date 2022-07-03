class CreateTbDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_documents do |t|
      t.string :doc_name
      t.string :doc_upload
      t.integer :user_id
      t.integer :document_category_id
      
      t.timestamps
    end
  end
end
