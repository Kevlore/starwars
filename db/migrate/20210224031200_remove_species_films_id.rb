class RemoveSpeciesFilmsId < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :species, :films_id
  end
end
