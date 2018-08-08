Gem::Specification.new do |s|
  s.name        = 'shookach'
  s.version     = '0.0.1'
  s.date        = '2018-08-08'
  s.summary     = 'Full-text search'
  s.description = 'A simple gem for full-text search'
  s.authors     = ['Bohdan Chaban']
  s.email       = 'b.chaban.91@gmail.com'
  s.files       = ['lib/shookach.rb',
                   'lib/shookach/indexer.rb', 'lib/shookach/searcher.rb', 'lib/shookach/railtie.rb',
                   'lib/tasks/shookach.rake']
  s.homepage    = 'http://rubygems.org/gems/shookach'
  s.license     = 'MIT'
end
