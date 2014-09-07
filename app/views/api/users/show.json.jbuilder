json.partial! "user", user: @user

if @questions
  json.unansweredQuestions @questions, partial: "api/questions/question", as: :question
end


