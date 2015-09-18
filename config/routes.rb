Rails.application.routes.draw do
  resources :posts, :only => [:index, :show] do
    get 'export' => 'post#export'
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
