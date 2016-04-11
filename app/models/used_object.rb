class UsedObject < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :last_name, :email, :to => :user, :prefix => :true
end
