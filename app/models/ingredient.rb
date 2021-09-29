class Ingredient < ApplicationRecord
  has_and_belongs_to_many :dishes, dependent: :delete_all
  validates :iname, presence: true
  validates :iname, uniqueness:true
  validates :iname, uniqueness: { case_sensitive: false }

  paginates_per 7

end
