require 'rails_helper'

RSpec.describe TbLabResultCategory, type: :model do
	describe '-- CREATE Category' do
		it 'is invalid create without a name' do
			labResultCategory = TbLabResultCategory.create(
				name: nil
			)
			labResultCategory.valid?
			expect(labResultCategory.errors[:name]).to include("can't be blank")
		end
		
		it "is invalid create with a duplicate name" do
			labResultCategory1 = TbLabResultCategory.create(
				name: 'Inactivated vaccines'
			)
			labResultCategory2 = TbLabResultCategory.create(
				name: 'Inactivated vaccines'
			)
		
			labResultCategory2.valid?
			expect(labResultCategory2.errors[:name]).to include("has already been taken")
		end
		
		it 'is valid create new category' do
			labResultCategory = TbLabResultCategory.create(
				name: 'Inactivated vaccines'
			)
			expect(labResultCategory).to be_valid
		end
	end

    describe '-- UPDATE category' do
        it 'is invalid update without valid id' do
            expect { 
                labResultCategory = TbLabResultCategory.find(1)
                labResultCategory.update(
                    name: 'Inactivated vaccines'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is invalid update without a name' do
            labResultCategory = TbLabResultCategory.create(
                name: "Inactivated vaccines"
            )
            labResultCategory.update(
                name: nil
            )
            labResultCategory.valid?
            expect(labResultCategory.errors[:name]).to include("can't be blank")
        end
        
        it "is invalid update with a duplicate name" do
            labResultCategory1 = TbLabResultCategory.create(
                name: 'Inactivated vaccines'
            )
            labResultCategory2 = TbLabResultCategory.create(
                name: 'Toxoid vaccines'
            )
            labResultCategory2.update(
                name: 'Inactivated vaccines'
            )
        
            labResultCategory2.valid?
            expect(labResultCategory2.errors[:name]).to include("has already been taken")
        end
        
        it 'is valid update category' do
            labResultCategory = TbLabResultCategory.create(
                name: 'Inactivated vaccines'
            )
            labResultCategory.update(
                name: 'Toxoid vaccines'
            )
            expect(labResultCategory).to be_valid
        end
    end
    
    describe '-- DELETE category' do
        it 'is invalid delete without valid id' do
            expect { TbLabResultCategory.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid delete category' do
            labResultCategory = TbLabResultCategory.create(
                name: 'Inactivated vaccines'
            )
            labResultCategory.destroy
            expect(labResultCategory).to be_valid
        end
    end
	
    describe '-- GET category' do
        it 'is invalid get without valid id' do
            expect { TbLabResultCategory.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid get category with valid id' do
            TbLabResultCategory.create(
                name: 'Inactivated vaccines'
            )
            labResultCategory = TbLabResultCategory.find(1)
            expect(labResultCategory).to be_valid
        end
    end
end
