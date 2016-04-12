class Polymorthicbid < ActiveRecord::Migration
  def change
    add_index :bids, :owner_id
  end
end
