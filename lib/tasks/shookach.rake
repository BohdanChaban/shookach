namespace :shookach do
  desc 'Index files'
  task :index, [:input, :output] => :environment do |_t, args|
    args.with_defaults(input: './public/input/', output: './public/output/')

    Shookach.index({ library_path: args.input, output_path: args.output })
  end
end
