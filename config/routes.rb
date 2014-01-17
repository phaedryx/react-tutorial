ReactTutorial::Application.routes.draw do
  root "welcome#index"

  resources :comments, only: [:index, :create, :show], defaults: {format: :json}
end
