ReactTutorial::Application.routes.draw do
  root "welcome#index"

  namespace :api do
    resources :comments, only: [:index, :create], defaults: {format: :json}
  end
end
