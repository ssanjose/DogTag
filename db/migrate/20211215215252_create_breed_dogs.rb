class CreateBreedDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :breed_dogs do |t|
      t.references :breed, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
