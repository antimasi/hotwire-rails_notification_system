class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :notifications, as: :notifiable, :dependent=>:destroy

  broadcasts_to ->(post){:posts}

  after_create :create_notification


  private

  def create_notification
    Notification.create receiver_id: user.id, sender_id: 2, action: "#{user.name} create a post", notifiable: self
  end
end
