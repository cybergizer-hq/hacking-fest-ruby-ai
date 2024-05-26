json.extract! comment, :id, :user_id, :message, :label, :emoji, :score, :created_at, :updated_at
json.url comment_url(comment, format: :json)
