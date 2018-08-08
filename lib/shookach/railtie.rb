require 'shookach'

class Shookach::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/shookach.rake'
  end
end
