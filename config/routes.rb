QuestionServices::Application.routes.draw do

  namespace :api do
    resources :users
    resources :questions
  end

  # root :to => 'welcome#index'

end
