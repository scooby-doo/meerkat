class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true
  has_many :projects, dependent: :destroy
  has_many :used_objects, dependent: :destroy
  has_many :bids, as: :owner, :dependent => :destroy

  def posted_projects
    projects
  end

  def posted_used_objects
    used_objects
  end

  def fullname
    "#{first_name} #{last_name}"
  end
end
