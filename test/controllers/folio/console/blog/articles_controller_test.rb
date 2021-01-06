# frozen_string_literal: true

require "test_helper"

class Folio::Console::Blog::ArticlesControllerTest < Folio::Console::BaseControllerTest
  test "index" do
    get url_for([:console, Folio::Blog::Article])
    assert_response :success
    create(:folio_blog_article)
    get url_for([:console, Folio::Blog::Article])
    assert_response :success
  end

  test "new" do
    get url_for([:console, Folio::Blog::Article, action: :new])
    assert_response :success
  end

  test "edit" do
    model = create(:folio_blog_article)
    get url_for([:edit, :console, model])
    assert_response :success
  end

  test "create" do
    params = build(:folio_blog_article).serializable_hash
    assert_equal(0, Folio::Blog::Article.count)
    post url_for([:console, Folio::Blog::Article]), params: {
      folio_blog_article: params,
    }
    assert_equal(1, Folio::Blog::Article.count, "Creates record")
  end

  test "update" do
    model = create(:folio_blog_article)
    assert_not_equal("Title", model.title)
    put url_for([:console, model]), params: {
      folio_blog_article: {
        title: "Title",
      },
    }
    assert_redirected_to url_for([:edit, :console, model])
    assert_equal("Title", model.reload.title)
  end

  test "destroy" do
    model = create(:folio_blog_article)
    delete url_for([:console, model])
    assert_redirected_to url_for([:console, Folio::Blog::Article])
    assert_not(Folio::Blog::Article.exists?(id: model.id))
  end
end
