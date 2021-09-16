class CreateCastCrewDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cast_crew_details do |t|
      t.string :name

      t.timestamps
    end
  end
end
