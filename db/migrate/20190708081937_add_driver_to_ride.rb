class AddDriverToRide < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :driver_id, :integer
  end
end
