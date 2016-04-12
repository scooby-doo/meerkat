class ChangeColumnNameForCmp < ActiveRecord::Migration
  def change
    rename_column :companies, :is_approved, :approved
  end
end
