class CreateMovieCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_casts do |t|
      t.string :role_name
      t.references :movie, null: false, foreign_key: true
      t.references :cast_crew_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
