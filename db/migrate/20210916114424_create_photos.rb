class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :img_url
      t.references :movie

      t.timestamps
    end
  end
end
