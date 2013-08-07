class CreateFermentationChecks < ActiveRecord::Migration
  def change
    create_table :fermentation_checks do |t|
      t.integer :fermentation_note_id
      t.integer :temperature
      t.integer :specific_gravity
      t.text :body
      t.integer :elapsed_time

      t.timestamps
    end
  end
end
