json.extract! movie_crew, :id, :movie_id, :cast_crew_detail_id, :department_id, :created_at, :updated_at
json.url movie_crew_url(movie_crew, format: :json)
