class CreateMovieCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_crews do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :cast_crew_detail, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
