json.(thread, :user_id_1, :user_id_2)

if thread.messages.order(:created_at).last
  json.messages(
    [thread.messages.order(:created_at).last],
    partial: "api/messages/message",
    as: :message)
end