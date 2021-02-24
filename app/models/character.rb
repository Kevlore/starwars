class Character < ApplicationRecord
  # has_many :species
  # has_many :films
  has_many :film_characters
  has_many :films, through: :film_characters

  validates :name, uniqueness: true
  validates :name, presence: true
end
