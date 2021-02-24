class CreateFilmSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :film_species do |t|
      t.references :film, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
