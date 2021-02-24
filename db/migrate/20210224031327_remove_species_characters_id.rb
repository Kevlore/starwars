class RemoveSpeciesCharactersId < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :species, :characters_id
  end
end
