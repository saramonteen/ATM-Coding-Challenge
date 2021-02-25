Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'getCache', to: 'geo#getCache'
  get '/getGeo/:ip', to: 'geo#getGeo', constraints: { ip: /.*/ }
end
