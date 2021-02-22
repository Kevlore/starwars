class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :birth_year
      t.string :gender
      t.string :hair_color
      t.string :height
      t.string :quote

      t.timestamps
    end
  end
end
