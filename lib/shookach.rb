require 'shookach/indexer'
require 'shookach/searcher'
require 'shookach/railtie' if defined?(Rails)

module Shookach
  def self.index(options = {})
    @options = default_configs.merge(options)

    Shookach::Indexer.new(@options[:library_path], @options[:output_path]).call
  end

  def self.search
    # Shookach::Searcher.new
  end

  private

  def self.default_configs
    {
      library_path: './public/input/',
      output_path: './public/output/'
    }
  end
end
