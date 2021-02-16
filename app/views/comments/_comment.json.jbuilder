json.extract! comment, :id, :body, :user, :post, :created_at, :updated_at
json.url comment_url(comment, format: :json)
