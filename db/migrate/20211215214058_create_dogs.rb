class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :gender, null: true, default: "male"
      t.string :size, null: false
      t.integer :likes, null: true, default: 1
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
