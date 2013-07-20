class AddPositionToPoi < ActiveRecord::Migration
  def change
    add_column :pois, :position, :integer
  end
end
