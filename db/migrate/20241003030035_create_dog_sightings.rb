class CreateDogSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_sightings do |t|
      t.text :dog_description
      t.text :location
      t.references :city, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
