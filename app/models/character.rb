class Character < ApplicationRecord
  # has_many :species
  # has_many :films
  has_many :film_characters
  has_many :films, through: :film_characters

  has_many :character_species
  has_many :species, through: :character_species

  validates :name, uniqueness: true
  validates :name, presence: true

  def self.search(search)
    if search
      character = Character.find_by(name: search)
      if character
        self.where(id: character)
      else
        Character.all.order("name")
      end
    else
      Character.all.order("name")
    end
  end
end
