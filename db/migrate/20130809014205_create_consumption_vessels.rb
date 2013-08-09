class CreateConsumptionVessels < ActiveRecord::Migration
  def change
    create_table :consumption_vessels do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
