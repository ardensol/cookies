class Addarticleimage < ActiveRecord::Migration
  def change
  	add_attachment :seo_pages, :article_image
  end
end
