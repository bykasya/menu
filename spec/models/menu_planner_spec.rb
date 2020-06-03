require 'rails_helper'

RSpec.describe MenuPlanner, type: :model do
 # subject { MenuPlanner.new(date:"06/03/2020", dish_type: 2, dish_id: 50)}

  it "is valid with valid attributes" do
    dish=Dish.create(dname: "MacNcheese")
    dish_type= 2
    date=Date.current
    subject= MenuPlanner.new(date: date, dish_type: dish_type, dish_id: dish.id)
     expect(subject).to be_valid
   end

    it "is not valid without a date" do
      subject=MenuPlanner.new
      subject.date=nil
     expect(subject).to_not be_valid
   end
   it "is not valid without a dish_type" do
     subject=MenuPlanner.new
     subject.dish_type=nil
     expect(subject).to_not be_valid
   end
   it "is not valid without a dish_type" do
     subject=MenuPlanner.new
     subject.dish_id=nil
     expect(subject).to_not be_valid
   end

end
