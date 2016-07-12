Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]

  resource :user, only: :create
end
