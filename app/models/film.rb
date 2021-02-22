class Film < ApplicationRecord
  belongs_to :species
  belongs_to :characters

  validates :title, :episode_id, uniqueness: true
  validates :title, :episode_id, presence: true
end
