require 'rails_helper'

RSpec.describe "Vaccines", type: :request do
	let!(:vaccine_categories) { create_list(:TbVaccineCategory, 5) }
    let!(:vaccines) { create_list(:TbVaccine, 5) }
    let(:vaccine_id) { vaccines.first.id }
end
