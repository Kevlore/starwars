class RemoveFilmsSpeciesId < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :films, :species_id
  end
end
