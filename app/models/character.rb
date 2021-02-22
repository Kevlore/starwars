class Character < ApplicationRecord
  has_many :species
  validates :name, uniqueness: true
end
