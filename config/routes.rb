Rails.application.routes.draw do
  resource :session, only: [:create]

  resource :profile, only: [:create, :show]
end
