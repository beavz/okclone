json.partial! "user", user: @user

if @questions
   json.unanswered_questions @questions, partial: "api/questions/question", as: :question
end

