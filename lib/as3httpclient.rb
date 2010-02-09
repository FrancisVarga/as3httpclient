
# Ensure this FILE NAME is the name you want for your library
# This is the primary criteria by which your library will be
# found by users of rubygems and sprouts
name = File.basename(__FILE__).split('.').shift

gem_wrap name do |t|
  # version is a dot-delimited, 3 digit version string
  t.version       = '0.0.0'
  # Short summary of your library or project
  t.summary       = "AS3 HTTP Client Library for Flex as a Gem"
  # Your name
  t.author        = ['Gabriel Handford', 'Francis Varga', 'Lennart Melzer']
  # Your email or - better yet - the address of your project email list
  t.email         = 'l.melzer@tu-bs.de'
  # The homepage of your library
  t.homepage      = ''
  t.sprout_spec   =<<EOF
- !ruby/object:Sprout::RemoteFileTarget 
  platform: universal
  filename: as3httpclient-src.zip
  archive_type: zip
  url: http://github.com/FrancisVarga/as3httpclient/zipball/0.0.0
  archive_path: FrancisVarga-as3httpclient-/src 
EOF
end

task :package => name
