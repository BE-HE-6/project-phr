require 'rails_helper'

RSpec.describe TbVaccineCategory, type: :model do
	describe '-- CREATE Vaccine Category' do
		it 'is invalid create without a name' do
			vaccineCategory = TbVaccineCategory.create(
				name: nil
			)
			vaccineCategory.valid?
			expect(vaccineCategory.errors[:name]).to include("can't be blank")
		end
		
		it "is invalid create with a duplicate name" do
			vaccineCategory1 = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
			vaccineCategory2 = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
		
			vaccineCategory2.valid?
			expect(vaccineCategory2.errors[:name]).to include("has already been taken")
		end
		
		it 'is valid create new category' do
			vaccineCategory = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
			expect(vaccineCategory).to be_valid
		end
	end

    describe '-- UPDATE category' do
        it 'is invalid update without valid id' do
            expect { 
                vaccineCategory = TbVaccineCategory.find(1)
                vaccineCategory.update(
                    name: 'Inactivated vaccines'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is invalid update without a name' do
            vaccineCategory = TbVaccineCategory.create(
                name: "Inactivated vaccines"
            )
            vaccineCategory.update(
                name: nil
            )
            vaccineCategory.valid?
            expect(vaccineCategory.errors[:name]).to include("can't be blank")
        end
        
        it "is invalid update with a duplicate name" do
            vaccineCategory1 = TbVaccineCategory.create(
                name: 'Inactivated vaccines'
            )
            vaccineCategory2 = TbVaccineCategory.create(
                name: 'Toxoid vaccines'
            )
            vaccineCategory2.update(
                name: 'Inactivated vaccines'
            )
        
            vaccineCategory2.valid?
            expect(vaccineCategory2.errors[:name]).to include("has already been taken")
        end
        
        it 'is valid update category' do
            vaccineCategory = TbVaccineCategory.create(
                name: 'Inactivated vaccines'
            )
            vaccineCategory.update(
                name: 'Toxoid vaccines'
            )
            expect(vaccineCategory).to be_valid
        end
    end
end
