class RemoveFilmsCharactersId < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :films, :characters_id
  end
end
