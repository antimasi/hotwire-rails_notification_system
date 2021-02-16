class Notification < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  after_create_commit :update_notifications
  after_destroy_commit :update_notifications
  scope :unread, -> { where(read_at: nil) }


  private

  def update_notifications
    @notifications = Notification.where(receiver_id: receiver_id).unread
    broadcast_replace_to receiver.id, "notifications", target: "notifications_items", partial:"notifications/notifications", locals:{notifications: @notifications}
    broadcast_replace_to receiver.id, "notifications", target:"notifications_counter", partial:"layouts/navbar/notifications_counter",locals: {notifications_count: @notifications.count}
  end

end
