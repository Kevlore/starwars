class CreateCharacterSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :character_species do |t|
      t.references :character, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
