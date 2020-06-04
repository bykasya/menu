require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject { Dish.new(dname: "Soup")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a dname" do
    subject.dname=nil
    expect(subject).to_not be_valid
  end

  it 'should validate uniqueness of dishname' do
  subject = Dish.create(dname: 'Soup')
   subjectip = Dish.create(dname: 'Soup')
   expect(subjectip).to_not be_valid
  end

end
