class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :details
      t.integer :price
      t.integer :period
      t.integer :owner_id
      t.integer :owner_type
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
