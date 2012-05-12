QuestionServices::Application.routes.draw do

  namespace :api do
    resources :users
    resources :questions

    get "questions/by_user/:id" => "questions#by_user"

  end

  # root :to => 'welcome#index'

end
