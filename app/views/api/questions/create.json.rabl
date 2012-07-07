object @question
attributes :id, :title
node(:image) do |q|
  q.image.nil? ? "" : q.image
end
node(:validation_errors, unless: -> q { q == nil }) do |q|
  q.errors
end