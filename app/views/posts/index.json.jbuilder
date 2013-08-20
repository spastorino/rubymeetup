json.array!(@posts) do |post|
  json.extract! post, :title, :description, :priority, :category, :user_id
  json.url post_url(post, format: :json)
end
