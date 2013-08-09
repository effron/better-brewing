class CreateServingVessels < ActiveRecord::Migration
  def change
    create_table :serving_vessels do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
