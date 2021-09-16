class MovieCrew < ApplicationRecord
  belongs_to :movie
  belongs_to :cast_crew_detail
  belongs_to :department
end
