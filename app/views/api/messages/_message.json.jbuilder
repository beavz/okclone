json.(message, :from_user_id, :to_user_id, :text, :created_at)

json.from_user_name User.find(message.from_user_id).username
json.to_user_name User.find(message.to_user_id).username

