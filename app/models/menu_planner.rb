class MenuPlanner < ApplicationRecord
  belongs_to :dish
  has_many :ingredients, through: :dishes

  validates :date, presence: true
  validates :dish_type, uniqueness: { scope: :date,
    message: "already assigned for this day"}
  validates :dish, presence: true

end
