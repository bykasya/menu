class Dish < ApplicationRecord
  has_and_belongs_to_many :dishes

  validates :dname, presence: true
  validates :dname, uniqueness:true
  validates :dname, uniqueness: { case_sensitive: false }
end
