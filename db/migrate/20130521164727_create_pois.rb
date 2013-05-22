class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.float :latitude
      t.float :longitude

      t.string :zip
      t.string :street
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
