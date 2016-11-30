require 'slim'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

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
end

activate :contentful do |f|
  f.space         = {site: '16sb97v25yu7'}
  f.access_token  = '09d86bb272bad2d92b1db19ea7e0cb33be1144da46115f618bcff1de1136060d'
  f.cda_query = { limit: 10000 }
  f.content_types = {
    homepage: 'homepage'
  }
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
# end

# Build-specific configuration
configure :build do
  activate :autoprefixer
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
