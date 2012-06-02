Fabricator(:question) do
  user!
  title { Forgery(:basic).text }
  question_type "text"
end

Fabricator(:question_with_three_answers, from: :question) do
  answers!(count: 3) {|q| Fabricate(:answer, question: q ) }
end

