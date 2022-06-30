require 'rails_helper'

RSpec.describe TbLabResultCategory, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '-- CREATE Lab Result Category' do
		it 'is invalid create without a name' do
			labresultCategory = TbLabResultCategory.create(
				name: nil
			)
			labresultCategory.valid?
			expect(labresultCategory.errors[:name]).to include("can't be blank")
		end

		it "is invalid create with a duplicate name" do
			labresultCategory1 = TbLabResultCategory.create(
				name: 'Inactivated lab result'
			)
			labresultCategory2 = TbLabResultCategory.create(
				name: 'Inactivated lab result'
			)

			labresultCategory2.valid?
			expect(labresultCategory2.errors[:name]).to include("has already been taken")
		end

		it 'is valid create new category' do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated lab result'
			)
			expect(labresultCategory).to be_valid
		end
	end

  describe '-- UPDATE category' do
    it 'is invalid update without valid id' do
        expect { 
            labresultCategory = TbLabResultCategory.find(1)
            labresultCategory.update(
                name: 'Inactivated lab result'
            ) 
        }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'is invalid update without a name' do
        labresultCategory = TbLabResultCategory.create(
            name: "Inactivated lab reslut"
        )
        labresultCategory.update(
            name: nil
        )
        labresultCategory.valid?
        expect(labresultCategory.errors[:name]).to include("can't be blank")
    end

    it "is invalid update with a duplicate name" do
        labresultCategory1 = TbLabResultCategory.create(
            name: 'Inactivated lab result'
        )
        labresultCategory2 = TbLabResultCategory.create(
            name: 'Clinic lab result'
        )
        labresultCategory2.update(
            name: 'Inactivated lab result'
        )

        labresultCategory2.valid?
        expect(labresultCategory2.errors[:name]).to include("has already been taken")
    end

    it 'is valid update category' do
        labresultCategory = TbLabResultCategory.create(
            name: 'Inactivated lab result'
        )
        labresultCategory.update(
            name: 'Clinic lab result'
        )
        expect(labresultCategory).to be_valid
    end
end
describe '-- DELETE category' do
  it 'is invalid delete without valid id' do
      expect { TbLabResultCategory.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'is valid delete category' do
      labresultCategory = TbLabResultCategory.create(
          name: 'Inactivated lab result'
      )
      labresultCategory.destroy
      expect(labresultCategory).to be_valid
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
      labresultCategory = TbLabResultCategory.find(1)
      expect(labresultCategory).to be_valid
  end
end
end
