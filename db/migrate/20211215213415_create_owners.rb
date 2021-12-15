class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.text :story, null: true, default: "No Story for this Individual."

      t.timestamps
    end
  end
end
