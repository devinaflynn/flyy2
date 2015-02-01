require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :apps
  has_many :comments

  mount_uploader :avatar, AvatarUploader

  # validates :name, presence: true, on: :update, if: !password.empty?

  mount_uploader :profile_image, ProfileImageUploader

  acts_as_voter

  #def my_complete_profile_info
  #	name + ',' +...
  #end
end
