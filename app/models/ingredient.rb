class Ingredient < ApplicationRecord
  has_and_belongs_to_many :dishes
  validates :iname, presence: true
  validates :iname, uniqueness:true
  validates :iname, uniqueness: { case_sensitive: false }
end
