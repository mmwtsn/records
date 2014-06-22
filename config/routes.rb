Rails.application.routes.draw do
  root 'records#index'

  resources :records do
    collection do
      post 'search'
    end
  end

end
