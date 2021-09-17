class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :language
  has_one :movie_detail
  has_many :photos
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres
  has_many :movie_casts, dependent: :destroy
  has_many :cast_crew_detail, through: :movie_casts
  has_many :movie_crews, dependent: :destroy
  has_many :cast_crew_detail, through: :movie_crews

  def self.add_record(movie_hash)
    if (movie_hash["category"] != nil and movie_hash["release_date"] != nil)
      category = Category.where("lower(category) = ?", movie_hash["category"].downcase).first_or_create
      language = Language.where("lower(lang) = ?", movie_hash["language"].downcase).first_or_create
      movie = Movie.where("lower(title) = ?", movie_hash["title"].downcase).first
      if (movie.nil?)
        movie = Movie.create(title: movie_hash["title"], release_date: Date.parse(movie_hash["release_date"]), rating: movie_hash["rating"].to_f,
                             trailer_link: movie_hash["trailer_link"], description: movie_hash["description"], story_line: movie_hash["story_line"],
                             category_id: category.id, language_id: language.id)
      end
      # adding genres
      genres_str = movie_hash["movie_genres"]
      if (!genres_str.nil? and !genres_str.empty?)
        genres = genres_str.split(":").map { |genre| genre.strip }
        for genre in genres
          gen = Genre.where("lower(genre_type) = ?", genre.downcase).first_or_create
          movie.movie_genres.create(genre_id: gen.id)
        end
      end

      for i in 1..3
        # adding photos
        url = movie_hash[("photo" + i.to_s)]
        photo = Photo.create(img_url: url, movie_id: movie.id) if !url.nil? and !url.empty?

        role, cast_name = movie_hash[("cast" + i.to_s)].split(":").map { |str| str.strip } if !movie_hash["cast" + i.to_s].nil?
        dept_name, crew_name = movie_hash[("crew" + i.to_s)].split(":").map { |str| str.strip } if !movie_hash["crew" + i.to_s].nil?

        # adding cast
        if (!role.nil? and !cast_name.nil? and !role.empty? and !cast_name.empty?)
          cast = CastCrewDetail.where("lower(name) = ?", cast_name.downcase).first_or_create
          movie_cast = MovieCast.create(role_name: role, cast_crew_detail_id: cast.id, movie_id: movie.id)
        end

        # adding crew
        if (!dept_name.nil? and !crew_name.nil? and !dept_name.empty? and !crew_name.empty?)
          dept = Department.where("lower(name) = ?", dept_name.downcase).first_or_create
          crew = CastCrewDetail.where("lower(name) = ?", crew_name.downcase).first_or_create
          movie_crew = MovieCrew.create(department_id: dept.id, cast_crew_detail_id: crew.id, movie_id: movie.id)
        end
      end

      puts(movie)
    end
  end
end
