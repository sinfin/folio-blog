# frozen_string_literal: true

class Folio::Console::Blog::ArticlesController < Folio::Console::BaseController
  folio_console_controller_for "Folio::Blog::Article"

  private
    def article_params
      params.require(:folio_blog_article)
            .permit(:title,
                    :slug,
                    :perex,
                    :locale,
                    :meta_title,
                    :meta_description,
                    :featured,
                    :published,
                    :published_at)
    end

    def index_filters
      {}
    end

    def folio_console_collection_includes
      []
    end

    def folio_console_record_includes
      []
    end
end
