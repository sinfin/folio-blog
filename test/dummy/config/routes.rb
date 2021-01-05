Rails.application.routes.draw do
  mount Folio::Blog::Engine => "/"
end
