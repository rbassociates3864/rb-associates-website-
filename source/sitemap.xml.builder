xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.destination_path =~ /\.html/ && page.data.sitemap != false }.sort_by{|r| r.data.priority }.reverse!.each do |page|
    xml.url do
      loc = "#{data.sitemap.url}"
      loc += "#{page.url}" unless "#{page.url}" == "/"
      xml.loc loc
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq page.data.changefreq || "monthly"
      xml.priority page.data.priority || "0.5"
    end
  end
end
