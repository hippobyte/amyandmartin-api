# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  # PUBLIC API
  namespace 'api', defaults: { format: :json } do
    post '/guest/webhook', to: 'guest#webhook'
  end
end
