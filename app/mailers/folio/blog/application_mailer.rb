# frozen_string_literal: true

module Folio
  module Blog
    class ApplicationMailer < ActionMailer::Base
      default from: "from@example.com"
      layout "mailer"
    end
  end
end
