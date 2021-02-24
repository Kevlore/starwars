class RenameSpeciesSkinColours < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :species, :skin_colours, :skin_colors
  end
end
