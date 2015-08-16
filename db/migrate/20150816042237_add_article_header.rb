class AddArticleHeader < ActiveRecord::Migration
  def change
  	add_column :seo_pages, :article_header, :string
  end
end
