Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]

  resource :profile, only: [:create, :show]
end
