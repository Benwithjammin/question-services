Fabricator(:question) do
  user
  title { Forgery(:basic).text }
  question_type "text"
end

