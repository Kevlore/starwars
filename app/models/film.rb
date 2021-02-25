class Film < ApplicationRecord
  has_many :film_characters
  has_many :characters, through: :film_characters

  validates :title, presence: true, uniqueness: true

  def self.search(search)
    if search
      film = Film.find_by(title: search)
      if film
        self.where(id: film)
      else
        Film.all
      end
    else
      Film.all
    end
  end
end
