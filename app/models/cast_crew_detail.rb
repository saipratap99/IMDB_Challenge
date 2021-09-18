class CastCrewDetail < ApplicationRecord
  has_many :movie_casts
  has_many :movies, through: :movie_casts
  has_many :movie_crews
  has_many :movies, through: :movie_crews
end
