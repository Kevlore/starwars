class Species < ApplicationRecord
  # belongs_to :characters
  # belongs_to :films
  has_many :character_species
  has_many :characters, through: :character_species

  has_many :film_species
  has_many :films, through: :film_species

  validates :name, presence: true
  validates :name, uniqueness: true
end
