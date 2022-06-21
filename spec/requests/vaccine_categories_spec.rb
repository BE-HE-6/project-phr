require 'rails_helper'

RSpec.describe "VaccineCategories", type: :request do
	let!(:vaccine_categories) { create_list(:TbVaccineCategory, 5) }
    let(:vaccine_category_id) { vaccine_categories.first.id }
end
