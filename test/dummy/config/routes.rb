# frozen_string_literal: true

Rails.application.routes.draw do
  mount Folio::Blog::Engine => "/"
end
