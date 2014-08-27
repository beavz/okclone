class AcceptableResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  has_one(
    :question,
    class_name: "Question",
    through: :answer,
    source: :question
  )

end
