post '/sessions', to: 'sessions#create'
post '/registrations', to: 'registrations#create'
get '/registrations', to: 'registrations#new'

get '/login', to: 'sessions#new'

get '/', to: 'home#index'