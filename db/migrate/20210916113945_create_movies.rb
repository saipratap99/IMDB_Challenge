class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.decimal :rating
      t.string :trailer_link
      t.string :description
      t.string :story_line
      t.references :category, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
