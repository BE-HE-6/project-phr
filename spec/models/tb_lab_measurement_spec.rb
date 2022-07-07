require 'rails_helper'

RSpec.describe TbLabMeasurement, type: :model do
  describe '-- CREATE Category' do
		it 'is invalid create without a name' do
			labMeasurement = TbLabMeasurement.create(
				name: nil
			)
			labMeasurement.valid?
			expect(labMeasurement.errors[:name]).to include("can't be blank")
		end
		
		it 'is valid create new category' do
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated vaccines'
			)
			expect(labMeasurement).to be_valid
		end
	end

    describe '-- UPDATE category' do
        it 'is invalid update without valid id' do
            expect { 
                labMeasurement = TbLabMeasurement.find(1)
                labMeasurement.update(
                    name: 'Inactivated vaccines'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is invalid update without a name' do
            labMeasurement = TbLabMeasurement.create(
                name: "Inactivated vaccines"
            )
            labMeasurement.update(
                name: nil
            )
            labMeasurement.valid?
            expect(labMeasurement.errors[:name]).to include("can't be blank")
        end
        
        it 'is valid update category' do
            labMeasurement = TbLabMeasurement.create(
                name: 'Inactivated vaccines'
            )
            labMeasurement.update(
                name: 'Toxoid vaccines'
            )
            expect(labMeasurement).to be_valid
        end
    end
    
    describe '-- DELETE category' do
        it 'is invalid delete without valid id' do
            expect { TbLabMeasurement.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid delete category' do
            labMeasurement = TbLabMeasurement.create(
                name: 'Inactivated vaccines'
            )
            labMeasurement.destroy
            expect(labMeasurement).to be_valid
        end
    end
	
    describe '-- GET category' do
        it 'is invalid get without valid id' do
            expect { TbLabMeasurement.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid get category with valid id' do
            TbLabMeasurement.create(
                name: 'Inactivated vaccines'
            )
            labMeasurement = TbLabMeasurement.find(1)
            expect(labMeasurement).to be_valid
        end
    end
end
