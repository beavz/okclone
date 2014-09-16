class Message < ActiveRecord::Base
  validate :from_user_id, :to_user_id, :text, presence: true
  belongs_to( :thread )
  belongs_to(
    :from_user,
    class_name: "User",
    foreign_key: :from_user_id,
    primary_key: :id
  )

  belongs_to(
    :to_user,
    class_name: "User",
    foreign_key: :to_user_id,
    primary_key: :id
  )

end
