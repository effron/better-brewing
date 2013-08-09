class CreateTastingNotes < ActiveRecord::Migration
  def change
    create_table :tasting_notes do |t|
      t.integer :brew_note_id
      t.integer :alcohol
      t.integer :dark_fruit
      t.integer :citrus_fruit
      t.integer :hoppy
      t.integer :floral
      t.integer :spicy
      t.integer :herbal
      t.integer :malty
      t.integer :toffee
      t.integer :burnt
      t.integer :sweet
      t.integer :sour
      t.integer :bitter
      t.integer :dry
      t.integer :body
      t.integer :linger
      t.integer :serving_vessel_id
      t.integer :consumption_vessel_id
      t.integer :rating
      t.text :misc
      t.text :appearance
      t.text :aroma
      t.text :flavor

      t.timestamps
    end
  end
end
