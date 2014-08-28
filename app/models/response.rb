class Response < ActiveRecord::Base
  validate :one_response_per_user_per_question

  belongs_to :user,     dependent: :destroy
  belongs_to :answer,   dependent: :destroy
  has_one :question, through: :answer, source: :question, dependent: :destroy

  def one_response_per_user_per_question
    conflicting_responses = self.question.responses
          .where("responses.user_id = ?", self.user_id)
          .where( "(:id IS NULL) OR (responses.id != :id)", id: self.id)

    unless conflicting_responses.empty?
      errors[:base] << "one response per user per question"
    end
  end
end
