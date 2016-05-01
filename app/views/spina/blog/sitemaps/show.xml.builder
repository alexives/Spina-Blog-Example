xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.9", "xmlns:xhtml" => "http://www.w3.org/1999/xhtml" do
  @blogposts.each do |post|
    xml.url do
      xml.loc "#{request.protocol}#{request.host}#{post.materialized_path}"
      xml.lastmod post.updated_at.to_date
      xml.changefreq "weekly"
      xml.priority 0.9
    end
  end
end