class CreateBoilNotes < ActiveRecord::Migration
  def change
    create_table :boil_notes do |t|
      t.integer :brew_note_id
      t.integer :pre_boil_volume
      t.integer :post_boil_volume
      t.text :body

      t.timestamps
    end
  end
end
