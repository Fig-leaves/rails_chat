json.array!(@messages) do |message|
  json.extract! message, :id, :name, :content, :room_id
  json.url message_url(message, format: :json)
end
