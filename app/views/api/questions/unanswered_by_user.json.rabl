collection @questions
attributes :id, :title, :user_answer
node(:image) do |q|
  q.image.nil? ? "" : q.image
end
child :answers do
  attributes :id, :text, :percentage
end