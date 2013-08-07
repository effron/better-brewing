class CreateBottlingNotes < ActiveRecord::Migration
  def change
    create_table :bottling_notes do |t|
      t.integer :brew_note_id
      t.integer :volume
      t.string :priming_sugar_type
      t.integer :priming_sugar_amount
      t.text :body

      t.timestamps
    end
  end
end
