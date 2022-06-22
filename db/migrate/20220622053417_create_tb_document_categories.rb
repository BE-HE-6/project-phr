class CreateTbDocumentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :tb_document_categories do |t|

      t.timestamps
    end
  end
end
