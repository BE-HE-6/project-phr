require 'rails_helper'

RSpec.describe "Documents", type: :request do
	let!(:document_categories) { create_list(:TbDocumentCategory, 5) }
    let!(:documents) { create_list(:TbDocument, 5) }
    let(:document_id) { documents.first.id }
end
