# frozen_string_literal: true

class Folio::Blog::Article < Folio::Blog::ApplicationRecord
  extend FriendlyId
  include Folio::HasAttachments
  include Folio::Publishable::WithDate
  include Folio::HasAtoms::Basic

  self.table_name = "folio_blog_articles"

  friendly_id :title, use: %i[slugged history]

  # Validations
  validates :title,
            :slug,
            :perex,
            presence: true

  validates :slug, uniqueness: true

  validates :locale,
            presence: I18n.available_locales.map(&:to_s)

  # Scopes
  pg_search_scope :by_query,
                  against: {
                    title: "A",
                    perex: "B"
                  },
                  ignoring: :accents,
                  using: {
                    tsearch: { prefix: true }
                  }

  multisearchable against: [:title],
                  ignoring: :accents

  scope :ordered, -> { order(published_at: :desc) }
  scope :featured, -> { where(featured: true) }

  def published_at_with_fallback
    published_at || created_at
  end
end

# == Schema Information
#
# Table name: folio_blog_articles
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  slug             :string
#  perex            :text
#  locale           :string
#  meta_title       :string
#  meta_description :text
#  featured         :boolean
#  published        :boolean
#  published_at     :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_folio_blog_articles_on_featured      (featured)
#  index_folio_blog_articles_on_locale        (locale)
#  index_folio_blog_articles_on_published     (published)
#  index_folio_blog_articles_on_published_at  (published_at)
#  index_folio_blog_articles_on_slug          (slug)
#
