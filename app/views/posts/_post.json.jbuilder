json.extract! post, :id, :date, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
