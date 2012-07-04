object @response
attributes :id, :question, :answer
node(:validation_errors, unless: -> q { q == nil }) do |q|
  q.errors
end