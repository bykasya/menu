require 'rails_helper'

RSpec.describe Ingredient, type: :model do
      subject { Ingredient.new(iname: "Onion")}

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a dname" do
      subject.iname=nil
      expect(subject).to_not be_valid
    end

    it 'should validate uniqueness of ingredient name' do
    subject = Ingredient.create(iname: 'Tomato')
     subjectip = Ingredient.create(iname: 'Tomato')
     expect(subjectip).to_not be_valid
    end

end
