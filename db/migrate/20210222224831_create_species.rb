class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :average_height
      t.string :average_lifespan
      t.string :skin_colours
      t.string :language
      t.references :characters, null: false, foreign_key: true
      t.references :films, null: false, foreign_key: true

      t.timestamps
    end
  end
end
