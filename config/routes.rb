CineflixVimeo::Application.routes.draw do
  root 'videos#new'
  resources :videos
end
