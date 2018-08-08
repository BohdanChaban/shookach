class Indexer
  def initialize(library_path, output_path)
    @library_path = library_path
    create_index_file(output_path)
  end

  def call
    write_dir_indexes

    @output_file.close
  end

  private

  def create_index_file(path)
    Dir.mkdir(path) unless File.exists?(path)

    @output_file = File.open("#{path}indexes#{Time.now.strftime('%Y%m%d%H%M%S')}.yml", 'w')
  end

  def write_dir_indexes
    puts "Indexing directory: #{@library_path}"

    Dir.foreach(@library_path) do |filename|
      next if filename == '.' || filename == '..'

      write_file_indexes(filename)
    end

    puts "Output file: #{@output_file.path}"
  end

  def write_file_indexes(filename)
    puts "Indexing file: #{filename}"

    @file = File.open("#{@library_path}/#{filename}", 'r')

    sentences_arr.each_with_index do |sentence, s_index|
      words = sentence.split(' ')

      words.each_with_index do |word, w_index|
        @output_file.write("#{word}:\r file: #{filename}\r sentence: #{s_index}\r word: #{w_index}\n")
      end
    end

    @file.close
  end

  def sentences_arr
    @file.read().gsub(',', ' ').gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
end
