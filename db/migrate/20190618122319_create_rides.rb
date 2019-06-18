class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :user, foreign_key: true
      t.string :origin
      t.string :destination
      t.datetime :time
      t.integer :capacity

      t.timestamps
    end
  end
end
