class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.text :xml

      t.timestamps
    end
  end
end
