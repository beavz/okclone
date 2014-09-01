class Question < ActiveRecord::Base
  has_many :answers
  has_many :responses, through: :answers, source: :responses

  def self.find_unanswered(user)
    self.find_by_sql([<<-SQL, user.id])
      SELECT questions.*
      FROM questions
      WHERE questions.id NOT IN (
        SELECT questions.id
        FROM questions
        JOIN answers on answers.question_id = questions.id
        JOIN responses on responses.answer_id = answers.id
        WHERE responses.user_id = ?
      )
    SQL
  end
end
