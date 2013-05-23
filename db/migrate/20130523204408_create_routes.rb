class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.text :desc
      t.timestamps
    end

    add_column :pois, :route_id, :integer
  end
end
