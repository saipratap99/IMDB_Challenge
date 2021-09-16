class CreateMovieDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_details do |t|
      t.string :runtime
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
