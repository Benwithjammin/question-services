object @question
attributes :id, :title, :question_type
child :answers do
  attributes :id, :text, :percentage
end