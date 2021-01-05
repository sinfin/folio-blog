# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect("/folio-blog")

  mount Folio::Engine => "/"
  mount Folio::Blog::Engine => "/"
end
