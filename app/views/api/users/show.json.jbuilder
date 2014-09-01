json.partial! "user", user: @user
json.responses @user.responses, partial: "api/responses/response", as: :response

if @questions
   json.unanswered_questions @questions, partial: "api/questions/question", as: :question
end