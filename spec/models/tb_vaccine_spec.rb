require 'rails_helper'

RSpec.describe TbVaccine, type: :model do
	describe '-- CREATE Vaccine' do
		it 'is invalid create with nil data' do
			vaccine = TbVaccine.create(
				name: nil,
                location: nil,
                user_id: nil,
                vaccine_category_id: nil
			)
			vaccine.valid?
			expect(vaccine.errors[:name]).to include("can't be blank")
			expect(vaccine.errors[:location]).to include("can't be blank")
			expect(vaccine.errors[:user_id]).to include("can't be blank")
			expect(vaccine.errors[:user_id]).to include("is not a number")
			expect(vaccine.errors[:tb_vaccine_category]).to include("must exist")
			expect(vaccine.errors[:vaccine_category_id]).to include("can't be blank")
			expect(vaccine.errors[:vaccine_category_id]).to include("is not a number")
		end
		
		it "is invalid create without a valid vaccine category id" do
			vaccineCategory = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			) # this id is 1
			vaccine = TbVaccine.create(
				name: 'Vaksin COVID-19',
                location: 'POLRES Kota Bekasi',
                user_id: 1,
                vaccine_category_id: 2
			)
			expect(vaccine.errors[:tb_vaccine_category]).to include("must exist")
		end
		
		it 'is valid create new vaccine data' do
			vaccineCategory = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
			vaccine = TbVaccine.create(
				name: 'Vaksin COVID-19',
                location: 'POLRES Kota Bekasi',
                user_id: 1,
                vaccine_category_id: vaccineCategory.id
			)
			expect(vaccineCategory).to be_valid
			expect(vaccine).to be_valid
		end
	end

    describe '-- UPDATE Vaccine' do
        it 'is invalid update without valid id' do
            expect { 
                vaccine = TbVaccine.find(1)
                vaccine.update(
                    name: 'Vaksin COVID-19'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is invalid update without a name' do
			vaccineCategory = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
			vaccine = TbVaccine.create(
				name: 'Vaksin COVID-19',
                location: 'POLRES Kota Bekasi',
                user_id: 1,
                vaccine_category_id: vaccineCategory.id
			)
            vaccine.update(
                name: nil
            )
            vaccine.valid?
            expect(vaccine.errors[:name]).to include("can't be blank")
        end
        
        it 'is valid update Vaccine' do
			vaccineCategory = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
			vaccine = TbVaccine.create(
				name: 'Vaksin COVID-19',
                location: 'POLRES Kota Bekasi',
                user_id: 1,
                vaccine_category_id: vaccineCategory.id
			)
            vaccine.update(
                location: 'POLRES Kota Jakarta',
            )
            expect(vaccine).to be_valid
        end
    end

    describe '-- DELETE Vaccine' do
        it 'is invalid delete without valid id' do
            expect { TbVaccine.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid delete Vaccine' do
			vaccineCategory = TbVaccineCategory.create(
				name: 'Inactivated vaccines'
			)
			vaccine = TbVaccine.create(
				name: 'Vaksin COVID-19',
                location: 'POLRES Kota Bekasi',
                user_id: 1,
                vaccine_category_id: vaccineCategory.id
			)
            vaccine.destroy
            expect(vaccine).to be_valid
        end
    end
end
