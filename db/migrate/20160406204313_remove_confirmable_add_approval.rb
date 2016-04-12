class RemoveConfirmableAddApproval < ActiveRecord::Migration
  def change
    remove_column :companies, :unconfirmed_email, :string
    remove_column :companies, :confirmation_token, :string
    remove_column :companies, :confirmed_at, :datetime
    remove_column :companies, :confirmation_sent_at, :datetime
    add_column :companies, :is_approved, :boolean, :default => false
  end
end
