class CreateBrewNotes < ActiveRecord::Migration
  def change
    create_table :brew_notes do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :body

      t.timestamps
    end
  end
end
