class Question < ActiveRecord::Base
  has_many :answers
  has_many :responses, through: :answers, source: :responses

  def self.find_unanswered(user)
  end
end
