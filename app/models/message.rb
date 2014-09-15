class Message < ActiveRecord::Base
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
