class FilmCharacter < ApplicationRecord
  belongs_to :film
  belongs_to :character
end
