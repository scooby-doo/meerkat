class Fixbid < ActiveRecord::Migration
  def change
    change_column :bids, :owner_type, :string
  end
end
