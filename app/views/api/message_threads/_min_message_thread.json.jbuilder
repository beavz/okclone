other_user = User.find(thread.user_id_1 == current_user.id ? thread.user_id_2 : thread.user_id_1 )
last_message = thread.messages.order(:created_at).last

json.(thread, :user_id_1, :user_id_2, :id)

json.otherUserId other_user.id
json.otherUserName other_user.username
json.otherUserAvatar other_user.avatar.image.url(:small)

if thread.messages.order(:created_at).last
  json.lastMessage last_message.text
  json.lastMessageFrom last_message.from_user_id
  json.lastMessageDate last_message.created_at
end