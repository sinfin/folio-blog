# frozen_string_literal: true

require "faker"
require Folio::Engine.root.join("test/dummy/db/seeds")

Folio::Blog::Article.destroy_all

images = Folio::Image.all.to_a

20.times do
  Folio::Blog::Article.create!(title: Faker::Hipster.sentence,
                               perex: Faker::Hipster.paragraph,
                               cover: images.sample,
                               published: true,
                               published_at: Time.zone.now - rand(0..30).days - rand(0..500).minutes,
                               locale: I18n.available_locales.sample)
end
