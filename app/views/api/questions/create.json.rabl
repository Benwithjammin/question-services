object @question
attributes :id, :title, :image
node(:validation_errors, unless: -> q { q == nil }) do |q|
  q.errors
end