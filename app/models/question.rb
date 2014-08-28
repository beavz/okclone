class Question < ActiveRecord::Base
  has_many :answers
  
  def self.find_unanswered(user)
  end
end
