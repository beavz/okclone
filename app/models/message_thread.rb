class MessageThread < ActiveRecord::Base
  has_many(
    :messages,
    class_name: "Message",
    foreign_key: :thread_id,
    primary_key: :id
  )
end
