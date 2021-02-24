class Film < ApplicationRecord
  # belongs_to :species
  # belongs_to :characters
  has_many :film_characters
  has_many :characters, through: :film_characters

  # validates :title, presence: true, uniqueness: true
end
