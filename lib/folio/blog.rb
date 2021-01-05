# frozen_string_literal: true

require "folio"
require "folio/blog/engine"

module Folio
  module Blog
    def self.table_name_prefix
      "folio_blog_"
    end
  end
end
