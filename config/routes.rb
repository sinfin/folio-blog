# frozen_string_literal: true

Folio::Blog::Engine.routes.draw do
  scope as: :folio_blog do
    resources :articles, only: [:index, :show] do
      get :preview
    end
  end
end
