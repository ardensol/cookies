class CreateSeoPages < ActiveRecord::Migration
  def change
    create_table :seo_pages do |t|
      t.string :h1_text
      t.string :h2_text
      t.string :og_description
      t.string :slug
      t.string :image_tag
      t.string :name
      t.text :paragraph_text

      t.timestamps null: false
    end
  end
end
