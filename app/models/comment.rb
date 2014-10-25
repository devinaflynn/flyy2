class Comment < ActiveRecord::Base
  belongs_to :app
  belongs_to :user

  validates :body, presence: true
end
