QuestionServices::Application.routes.draw do

  namespace :api do
    resources :users
  end

  # root :to => 'welcome#index'

end
