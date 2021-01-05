# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect("/articles")

  mount Folio::Blog::Engine => "/"
  mount Folio::Engine => "/"
end
