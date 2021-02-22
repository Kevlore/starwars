class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :episode_id
      t.string :director
      t.date :release_date
      t.references :species, null: false, foreign_key: true
      t.references :characters, null: false, foreign_key: true

      t.timestamps
    end
  end
end
