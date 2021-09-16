class AddIndeToLanguageLang < ActiveRecord::Migration[6.0]
  def change
    add_index :languages, :lang, unique: true
    add_index :categories, :category, unique: true
    add_index :genres, :genre_type, unique: true
    add_index :departments, :name, unique: true
    add_index :movies, :title, unique: true
  end
end
