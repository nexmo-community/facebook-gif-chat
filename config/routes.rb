Rails.application.routes.draw do
  post '/inbound', to: 'chat#inbound'
  post '/status', to: 'chat#status'
end
