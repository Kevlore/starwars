class Species < ApplicationRecord
  has_many :character_species
  has_many :characters, through: :character_species

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(search)
    if search
      specy = Species.find_by(name: search)
      if specy
        self.where(id: specy)
      else
        Species.all.order("name")
      end
    else
      Species.all.order("name")
    end
  end
end
