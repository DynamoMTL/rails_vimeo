CineflixVimeo::Application.routes.draw do
  root 'home#index'

  resources :videos

  #Vimeo auth
  post :vimeo_auth, to: 'vimeo#auth'
  get :vimeo_callback, to: 'vimeo#callback'

end
