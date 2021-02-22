class Species < ApplicationRecord
  belongs_to :characters
  belongs_to :films
end
