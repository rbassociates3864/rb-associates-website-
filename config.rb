require 'slim'
require 'builder'

require 'lib/property_page'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/sitemap.xml", layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

activate :sprockets
sprockets.append_path File.join(root, "bower_components")

# Pretty URLs
activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  config[:host] = "http://localhost:4567"
end

activate :contentful do |f|
  f.space         = {site: '16sb97v25yu7'}
  f.access_token  = '09d86bb272bad2d92b1db19ea7e0cb33be1144da46115f618bcff1de1136060d'
  f.cda_query = { limit: 1000 }
  f.content_types = {
    homepage: 'homepage',
    propertyPage: 'propertyPage'
  }
end

###
# Helpers
###

helpers do
  def property_pages
    PropertyPage.all(data.site.propertyPage)
  end

  def property_pages_to_json
    properties = [].tap do |properties|
      PropertyPage.all(data.site.propertyPage).each do |pp|
        properties << pp.as_json
      end
    end

    properties.to_json
  end

  def find_property_by_url(url)
    property_pages.find { |p| p.url == url }
  end

  def nav_link_to(link, url, opts={})
    expected_url = config[:host]
    expected_url += current_page.url unless (current_page.url == '/')

    if expected_url == url
      prefix = '<li class="site-nav-item active" role="presentation">'
    else
      prefix = '<li class="site-nav-item" role="presentation">'
    end
    prefix + link_to(link, url, opts) + "</li>"
  end
end

# Methods defined in the helpers block are available in templates
# helpers do
# end

# Build-specific configuration
configure :build do

  # Host
  config[:host] = "https://www.rbassociates.com"

  activate :autoprefixer

  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
