desc "Upload site"
task :upload do
  # This tasks requires rsync.
  #
  # To configure, set 'src' to the path of the output directory on your local
  # computer (include a trailing slash). Set 'dst' to the path to your web
  # root (without trailing slash). Take a look at the example to see how it's
  # done (it's just a really simple rsync wrapper though).
  # Settings
  src = File.join(Dir.pwd, '/build/') # trailing slash
  dst = 'deploy@159.203.172.233:/var/www/html' # no trailing slash
  # Don't touch this! ;-)

  puts 'Building site...'
  sh('middleman build')
  puts 'Site built.'

  puts 'Publishing site...'
  puts "Source: #{src} | Destination: #{dst}"

  sh('rsync', '-gpPrvz', '--exclude=".git"', src, dst)

  puts 'Site published.'
end
