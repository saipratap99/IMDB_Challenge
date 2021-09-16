json.extract! movie_cast, :id, :role_name, :movie_id, :cast_crew_detail_id, :created_at, :updated_at
json.url movie_cast_url(movie_cast, format: :json)
