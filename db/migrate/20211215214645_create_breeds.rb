class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :title, null: false
      t.references :parent, null: true, foreign_key: { to_table: :breeds }

      t.timestamps
    end
  end
end
