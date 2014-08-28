class Response < ActiveRecord::Base
  validate :one_response_per_user_per_question

  belongs_to :user,     dependent: :destroy
  belongs_to :answer,   dependent: :destroy
  has_one :question, through: :answer, source: :question, dependent: :destroy

  def one_response_per_user_per_question
    answered_q_ids = User.find(user_id).answered_questions.pluck("id")
    if answered_q_ids.include?(Answer.find(answer_id).question.id)
      errors.add( "May only save one response per user per question.")
    end
  end
end
