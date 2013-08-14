class AddParentIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :parent_id, :integer
  end
end
