require "csv"

namespace :import do
  desc "Imports the authors data"

  task languages: :environment do
    file = Rails.root.join("lib/assets/Languages.csv")
    CSV.foreach(file, :headers => true) do |row|
      Language.where(row.to_hash).first_or_create
    end
  end

  task categories: :environment do
    file = Rails.root.join("lib/assets/Categories.csv")
    CSV.foreach(file, :headers => true) do |row|
      Category.where(row.to_hash).first_or_create
    end
  end

  task genres: :environment do
    file = Rails.root.join("lib/assets/Genres.csv")
    CSV.foreach(file, :headers => true) do |row|
      Genre.where(row.to_hash).first_or_create
    end
  end

  task departments: :environment do
    file = Rails.root.join("lib/assets/Departments.csv")
    CSV.foreach(file, :headers => true) do |row|
      Department.where(row.to_hash).first_or_create
    end
  end

  task movies: :environment do
    file = Rails.root.join("lib/assets/movies.csv")
    CSV.foreach(file, :headers => true) do |row|
      Movie.add_record(row.to_hash)
      # puts(row.to_hash["photo" + 1.to_s])
    end
  end

  task movie_cast: :environment do
    file = Rails.root.join("lib/assets/movies.csv")
    CSV.foreach(file, :headers => true) do |row|
      movie_hash = row.to_hash
      puts(movie_hash)
    end
  end
end
