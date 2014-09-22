module Catalog
  class CLI
    def initialize(args)
      @args = args
      @options = {}

      parser = OptionParser.new do |opts|
        opts.on('-p', '--path PATH', 'Path of the folder to clean') { |path| @options[:path] = path }
        opts.on('-c', '--config PATH', 'Path of your .catalog file') { |path| @options[:config] = path }
      end

      parser.parse!(args)
    end

    def run
      # Override .catalog file location
      Catalog::Config.config_path(@options[:config]) if @options[:config]

      # Run to organizer
      Catalog::Organizer.new(base_path: @options[:path]).run!
    end
  end
end
