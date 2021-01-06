# frozen_string_literal: true

Folio::Blog::Engine.routes.draw do
  scope module: :folio do
    namespace :console do
      namespace :blog do
        resources :articles, except: %i[show]
      end
    end
  end

  scope as: :folio_blog do
    resources :articles, only: %i[index show] do
      get :preview
    end
  end
end
