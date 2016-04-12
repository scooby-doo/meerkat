class Bid < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  belongs_to :project
  validates :details, presence: true, allow_blank: false
  validates :price, presence: true
  validates :period, presence: true
end
