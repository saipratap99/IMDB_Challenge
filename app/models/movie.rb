class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :language
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres
  has_many :movie_casts, dependent: :destroy
  has_many :cast_crew_detail, through: :movie_casts
  has_many :movie_crews, dependent: :destroy
  has_many :cast_crew_detail, through: :movie_crews
end
