class CreateSpargeNotes < ActiveRecord::Migration
  def change
    create_table :sparge_notes do |t|
      t.integer :brew_note_id
      t.integer :temperature
      t.integer :volume
      t.text :body

      t.timestamps
    end
  end
end
