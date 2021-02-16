json.extract! notification, :id, :receiver_id, :sender_id, :action, :read_at, :notifiable, :created_at, :updated_at
json.url notification_url(notification, format: :json)
