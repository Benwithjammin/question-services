object @question
attributes :id, :title, :question_type
node(:validation_errors, unless: -> q { q == nil }) do |q|
  q.errors
end