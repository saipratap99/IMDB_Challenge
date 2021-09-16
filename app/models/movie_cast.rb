class MovieCast < ApplicationRecord
  belongs_to :movie
  belongs_to :cast_crew_detail
end
