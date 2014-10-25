class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apps
  has_many :comments

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, on: :update

  #def my_complete_profile_info
  #	name + ',' +...
  #end
end
