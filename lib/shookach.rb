require './lib/shookach/indexer'
require './lib/shookach/searcher'

class Shookach
  def self.index(library_path = './public/input/')
    Indexer.new(library_path).call
  end

  def self.search
    # @searcher.call
  end
end
