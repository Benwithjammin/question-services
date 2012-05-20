Fabricator(:question) do
  title { Forgery(:basic).text }
  question_type "text"
end
