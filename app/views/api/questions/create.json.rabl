object @question
attributes :id, :title, :question_type
node(:validation_errors) do |u|
  u.errors
end