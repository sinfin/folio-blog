# frozen_string_literal: true

class CreateFolioBlogArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :folio_blog_articles do |t|
      t.string :title
      t.string :slug

      t.text :perex

      t.string :locale

      t.string :meta_title
      t.text :meta_description

      t.boolean :featured
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end

    add_index :folio_blog_articles, :slug
    add_index :folio_blog_articles, :locale
    add_index :folio_blog_articles, :featured
    add_index :folio_blog_articles, :published
    add_index :folio_blog_articles, :published_at
  end
end
