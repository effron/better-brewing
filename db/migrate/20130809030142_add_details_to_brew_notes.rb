class AddDetailsToBrewNotes < ActiveRecord::Migration
  def change
    add_column :brew_notes, :mash_volume, :integer
  end
end
