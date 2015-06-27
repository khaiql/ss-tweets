post '/posts', to: 'posts#create'
delete '/sessions', to: 'sessions#destroy'
get '/logout', to: 'sessions#destroy'
post '/sessions', to: 'sessions#create'
post '/registrations', to: 'registrations#create'
get '/registrations', to: 'registrations#new'

get '/login', to: 'sessions#new'

get '/', to: 'home#index'
