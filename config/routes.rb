Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students

  resources :coaches

  get '/problem_one', to: 'distributions#problem_one', as: 'problem_one'
  get '/problem_two', to: 'distributions#problem_two', as: 'problem_two'
  get '/problem_three', to: 'distributions#problem_three', as: 'problem_three'
end
