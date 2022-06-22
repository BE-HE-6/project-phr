require 'rails_helper'

RSpec.describe "DocumentCategories", type: :request do
	let!(:document_categories) { create_list(:TbDocumentCategory, 5) }
    let(:document_category_id) { document_categories.first.id }
end
