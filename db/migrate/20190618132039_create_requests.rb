class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :ride, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
