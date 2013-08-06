class CreateFermentationNotes < ActiveRecord::Migration
  def change
    create_table :fermentation_notes do |t|
      t.integer :brew_note_id
      t.integer :volume
      t.integer :og
      t.integer :fg
      t.text :body

      t.timestamps
    end
  end
end
