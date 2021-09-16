json.extract! movie, :id, :title, :release_date, :rating, :trailer_link, :description, :story_line, :category_id, :language_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
