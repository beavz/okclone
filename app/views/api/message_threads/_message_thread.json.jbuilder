other_user = User.find(thread.user_id_1 == current_user.id ? thread.user_id_2 : thread.user_id_1 )

json.(thread, :user_id_1, :user_id_2, :id)

json.otherUserId other_user.id
json.otherUserName other_user.username
json.otherUserAvatar other_user.avatar.image.url(:small)
json.otherUserAge other_user.age
json.otherUserLocation other_user.zip_code


json.messages thread.messages, partial: "api/messages/message", as: :message
