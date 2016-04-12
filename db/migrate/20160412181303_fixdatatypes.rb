class Fixdatatypes < ActiveRecord::Migration
  def change
    change_column :bids, :details, :text
    change_column :bids, :price, :decimal, precision: 15, scale: 2
  end
end
