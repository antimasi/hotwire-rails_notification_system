class User < ApplicationRecord
  has_many :posts
  has_many :comments

  has_many :notifications, as: :notifiable, foreign_key: :receiver_id
end
