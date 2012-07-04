object @question
attributes :id, :title, :question_type, :responses
child :answers do
  attributes :id, :text, :responses
end