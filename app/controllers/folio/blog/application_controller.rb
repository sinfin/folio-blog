module Folio
  module Blog
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
