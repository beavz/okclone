json.(response, :id, :answer_id, :explanation)
json.question do
  json.partial! 'api/questions/question', question: response.answer.question
end