# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/about', to: 'welcome#show'
  post '/game', to: 'game#create'
  get '/game', to: 'game#show'
end
