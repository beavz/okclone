json.(thread, :user_id_1, :user_id_2, :id)

json.messages thread.messages, partial: "api/messages/message", as: :message