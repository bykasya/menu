require 'faker'
FactoryBot.define do
  factory :dish do |f|
  f.dname { Faker::Food.dish }
end
end
