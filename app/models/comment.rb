class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :notifications, as: :notifiable

  after_create :create_notification


  private

  def create_notification
    Notification.create receiver_id: user.id, sender_id:2, action: "#{user.name} commented a post", notifiable: self
  end

end
