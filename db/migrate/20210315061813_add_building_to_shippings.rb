class AddBuildingToShippings < ActiveRecord::Migration[6.0]
  def change
    add_column :shippings, :building, :string
  end
end
