collection @questions
attributes :id, :title
node(:image) do |q|
  q.image.nil? ? "" : q.image
end
child :answers do
  attributes :id, :text, :order, :percentage
end