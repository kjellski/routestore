class AddRouteIdIndexToPoi < ActiveRecord::Migration
  def change
    add_index :pois, :route_id
  end
end
