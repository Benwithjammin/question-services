collection @questions
attributes :id, :title, :question_type, :user_answer
child :answers do
  attributes :id, :text, :percentage
end