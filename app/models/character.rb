class Character < ApplicationRecord
  has_many :species
  has_many :films
  validates :name, uniqueness: true
  validates :name, presence: true
end
