Fabricator(:answer) do
  question
  text { Forgery(:basic).text }
end
