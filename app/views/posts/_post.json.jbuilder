json.extract! post, :id, :content, :show_public, :created_at, :updated_at
json.url post_url(post, format: :json)