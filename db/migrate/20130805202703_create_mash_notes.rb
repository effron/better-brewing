class CreateMashNotes < ActiveRecord::Migration
  def change
    create_table :mash_notes do |t|
      t.integer :brew_note_id
      t.integer :time
      t.integer :temperature
      t.string :body

      t.timestamps
    end
  end
end
