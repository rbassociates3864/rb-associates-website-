require 'rbconfig'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

#if RbConfig::CONFIG['target_os'] =~ /darwin(1[0-3])/i
  gem 'eventmachine', '1.2.7', git: 'https://github.com/eventmachine/eventmachine.git', tag: 'v1.2.7'
#end

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1', platforms: [:mswin, :mingw, :x64_mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby, :x64_mingw]

# Middleman Gems
gem 'middleman', '~> 4.2'
gem 'middleman-sprockets'
#gem 'middleman-sprockets', '~> 4.0.0.rc.1' 
#gem 'sass'
gem 'middleman-livereload'
gem 'middleman-slim', require: false
gem 'middleman-autoprefixer'
gem 'font-awesome-middleman'
gem 'contentful_middleman' , :github => 'contentful/contentful_middleman', :branch => 'dl/upgrade-to-v4'
gem 'slim', '~> 3.0.7'

gem 'builder'

# Google Analytics
gem 'middleman-google-analytics', '~> 3.0'

# Assets
gem 'bootstrap-sass', '~> 3.3.6'
