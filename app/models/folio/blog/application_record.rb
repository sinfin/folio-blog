# frozen_string_literal: true

class Folio::Blog::ApplicationRecord < Folio::ApplicationRecord
  self.abstract_class = true

  def self.model_name
    @_model_name ||= super.tap do |name|
      %i[route_key singular_route_key param_key].each do |key|
        val = "blog_#{name.public_send(key)}"
        name.singleton_class.send(:define_method, key) { val }
      end
    end
  end
end
