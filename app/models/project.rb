class Project < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :last_name, :email, :to => :user, :prefix => :true
  has_many :supporting_files, as: :owner_to, :dependent => :destroy
end
