require 'rails_helper'

RSpec.describe User, type: :model do
  # context "associations users with other entity" do
  #   it { should have_many(:tb_blood_oxygens) }
  #   it { should have_many(:tb_blood_glucoses) }
  #   it { should have_many(:tb_documents) }
  #   it { should have_many(:tb_lab_results) }
  #   it { should have_many(:tb_vaccines) }
  #   it { should have_many(:tb_blood_pressures) }
  #   it { should have_many(:tb_body_weight_heights) }
  # end

  context "when attributes has wrong" do
    it "is invalid with a duplicate email" do
      user1 = FactoryBot.create(:user, email: 'user@example.com')
      user2 = FactoryBot.build(:user, email: 'user@example.com')
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it "is invalid without a email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a birth_place" do
      user = FactoryBot.build(:user, birth_place: nil)
      user.valid?
      expect(user.errors[:birth_place]).to include("can't be blank")
    end

    it "is invalid without a birth_date" do
      user = FactoryBot.build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end

    it "is invalid without a blood_type" do
      user = FactoryBot.build(:user, blood_type: nil)
      user.valid?
      expect(user.errors[:blood_type]).to include("can't be blank")
    end

    it "is invalid without a bpjs_id" do
      user = FactoryBot.build(:user, bpjs_id: nil)
      user.valid?
      expect(user.errors[:bpjs_id]).to include("can't be blank")
    end

    it "is invalid without a ktp_id" do
      user = FactoryBot.build(:user, ktp_id: nil)
      user.valid?
      expect(user.errors[:ktp_id]).to include("can't be blank")
    end
  end

  context "when attributes has correct" do
    it "is valid with valid attributes" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  context "when id BPJS has wrong format" do
    it "is invalid id BPJS have less than 11 characters" do
      user = FactoryBot.build(:user, bpjs_id: "1122334455")
      user.valid?
      expect(user.errors[:bpjs_id]).to include("is too short (minimum is 11 characters)")
    end

    it "is invalid id BPJS have more than 13 characters" do
      user = FactoryBot.build(:user, bpjs_id: "11223344556677")
      user.valid?
      expect(user.errors[:bpjs_id]).to include("is too long (maximum is 13 characters)")
    end
  end

  context "when id BPJS has correct format" do
    it "is valid id BPJS in 11 to 13 characters" do
      expect(FactoryBot.build(:user, bpjs_id: "0001484066778")).to be_valid
    end
  end

  context "when id KTP has wrong format" do
    it "is invalid id KTP have less than 16 characters" do
      user = FactoryBot.build(:user, ktp_id: "317400210923000")
      user.valid?
      expect(user.errors[:ktp_id]).to include("is the wrong length (should be 16 characters)")
    end

    it "is invalid id KTP have more than 16 characters" do
      user = FactoryBot.build(:user, ktp_id: "31740021092300022")
      user.valid?
      expect(user.errors[:ktp_id]).to include("is the wrong length (should be 16 characters)")
    end

    it "is not accept non numeric values for id KTP" do
      user = FactoryBot.build(:user, ktp_id: "3174002109230CBA")
      user.valid?
      expect(user.errors[:ktp_id]).to include("is not a number")
    end
  end

  context "when id KTP has correct format" do
    it "is valid id KTP have must 16 characters" do
      expect(FactoryBot.build(:user, ktp_id: "3174002109230002")).to be_valid
    end
  end

  context "when email has wrong format" do
    it "is invalid email without dot com" do
      expect(FactoryBot.build(:user, email: "user@example")).not_to be_valid
    end

    it "is invalid email without @ and dot com" do
      expect(FactoryBot.build(:user, email: "user")).not_to be_valid
    end
  end

  context "when email has correct format" do
    it "is valid email format" do
      expect(FactoryBot.build(:user, email: "user@example.com")).to be_valid
    end
  end

  context "when password has wrong format" do
    it "is invalid password have less than to 8 characters" do
      user = FactoryBot.build(:user, password: "example")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end

    it "is invalid password without least 1 uppercase" do
      expect(FactoryBot.build(:user, password: "examples20#")).not_to be_valid
    end

    it "is invalid password without least 1 lowercase" do
      expect(FactoryBot.build(:user, password: "EXAMPLES20#")).not_to be_valid
    end

    it "is invalid password without special char" do
      expect(FactoryBot.build(:user, password: "Examples20")).not_to be_valid
    end

    it "is invalid password without contain number" do
      expect(FactoryBot.build(:user, password: "Examples#")).not_to be_valid
    end
  end

  context "when password has correct format" do
    it "is valid password format" do
      expect(FactoryBot.build(:user, password: "Examples20#")).to be_valid
    end
  end
end