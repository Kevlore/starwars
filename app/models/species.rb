class Species < ApplicationRecord
  belongs_to :characters
  belongs_to :films

  validates :name, presence: true
  validates :name, uniqueness: true
end
