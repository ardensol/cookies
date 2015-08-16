json.array!(@seo_pages) do |seo_page|
  json.extract! seo_page, :id, :h1_text, :h2_text, :og_description, :slug, :image_tag, :name, :paragraph_text
  json.url seo_page_url(seo_page, format: :json)
end
