FactoryBot.define do
    factory :ingredient do |f|
    f.iname { Faker::Food.ingredient }
  end
end
