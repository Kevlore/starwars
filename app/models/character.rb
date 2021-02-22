class Character < ApplicationRecord
  validates :name, uniqueness: true
end
