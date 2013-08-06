class AddAttachmentBeerPhotoToBrewNotes < ActiveRecord::Migration
  def self.up
    change_table :brew_notes do |t|
      t.attachment :beer_photo
    end
  end

  def self.down
    drop_attached_file :brew_notes, :beer_photo
  end
end
