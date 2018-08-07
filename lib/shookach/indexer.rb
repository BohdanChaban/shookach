class Indexer
  def initialize(library_path)
    @path = library_path
    @output_file = File.open('./public/output/indexes.yml', 'w')
  end

  def call
    write_dir_indexes

    @output_file.close
  end

  private

  def write_dir_indexes
    puts "indexing directory: #{@path}"

    Dir.foreach(@path) do |filename|
      next if filename == '.' || filename == '..'

      write_file_indexes(filename)
    end
  end

  def write_file_indexes(filename)
    puts "indexing file: #{filename}"

    @file = File.open("#{@path}/#{filename}", 'r')

    sentences_arr.each_with_index do |sentence, s_index|
      words = sentence.split(' ')

      words.each_with_index do |word, w_index|
        @output_file.write("#{word}:\r file: #{filename}\r sentence: #{s_index}\r word: #{w_index}\n")
      end
    end

    @file.close
  end

  def sentences_arr
    @file.read().gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
end
