class Dish < ApplicationRecord
  has_and_belongs_to_many :ingredients

  validates :dname, presence: true
  validates :dname, uniqueness:true
  validates :dname, uniqueness: { case_sensitive: false }
  paginates_per 10
end
