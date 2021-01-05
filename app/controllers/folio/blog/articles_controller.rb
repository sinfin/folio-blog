# frozen_string_literal: true

class Folio::Blog::ArticlesController < Folio::Blog::ApplicationController
  before_action :find_article, only: [:show, :preview]

  def index
    articles = Folio::Blog::Article.published
                                   .ordered

    if collection_includes.present?
      articles = articles.includes(*collection_includes)
    end

    if params[:q].present?
      articles = articles.by_query(params[:q])
    end

    @pagy, @articles = pagy(articles, items: 10)
  end

  def show
    if @article.published?
      force_correct_path(url_for(@article))
    else
      redirect_to action: :preview
    end
  end

  def preview
    if @article.published?
      redirect_to action: :show
    else
      render :show
    end
  end

  private
    def find_article
      scope = Folio::Blog::Article.published_or_admin(account_signed_in?)

      if record_includes.present?
        scope = scope.includes(*record_includes)
      end

      @article = scope.friendly.find(params[:id])

      set_meta_variables(@article)
    end

    def collection_includes
    end

    def record_includes
    end
end
