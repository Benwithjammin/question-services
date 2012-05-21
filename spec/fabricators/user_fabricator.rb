Fabricator(:user) do
  name { Forgery(:name).full_name }
  email { Forgery(:email).address }
  password { Forgery(:basic).password }
end

Fabricator(:user_with_three_questions, from: :user) do
  questions!(count: 3) {|u| Fabricate(:question, user: u ) }
end
