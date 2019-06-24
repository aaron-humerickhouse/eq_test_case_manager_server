Rails.application.routes.draw do
  # TODO: make env variable
  default_url_options :host => ENV['HOST']

  devise_for :users,
             path: 'api/v1/users',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'api/v1/users/sessions',
               registrations: 'api/v1/users/registrations',
               passwords: 'api/v1/users/passwords',
               unlocks: 'api/v1/users/unlocks',
               confirmations: 'api/v1/users/confirmations'
             }

  get '/health', to: 'health#show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
