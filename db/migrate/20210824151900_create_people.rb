class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :films
      t.string :gender
      t.string :species

      t.timestamps
    end
  end
end
