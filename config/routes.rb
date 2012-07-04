QuestionServices::Application.routes.draw do

  namespace :api do
    resources :users

    resources :questions
    get "questions/by_user/:id" => "questions#by_user"
    get "questions/answered_by_user/:id" => "questions#answered_by_user"
    get "questions/unanswered_by_user/:id" => "questions#unanswered_by_user"

    resources :responses

  end

  # root :to => 'welcome#index'

end
