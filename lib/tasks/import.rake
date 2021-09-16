require "csv"

namespace :import do
  desc "Imports the authors data"

  task languages: :environment do
    file = Rails.root.join("lib/assets/Languages.csv")
    CSV.foreach(file, :headers => true) do |row|
      Language.create(row.to_hash)
    end
  end

  task categories: :environment do
    file = Rails.root.join("lib/assets/Categories.csv")
    CSV.foreach(file, :headers => true) do |row|
      Category.create(row.to_hash)
    end
  end

  task genres: :environment do
    file = Rails.root.join("lib/assets/Genres.csv")
    CSV.foreach(file, :headers => true) do |row|
      Genre.create(row.to_hash)
    end
  end

  task departments: :environment do
    file = Rails.root.join("lib/assets/Departments.csv")
    CSV.foreach(file, :headers => true) do |row|
      Department.create(row.to_hash)
    end
  end


end
