module Catalog
  module Config
    def self.drawers
      config['drawers']
    end

  private

    def self.config
      unless @config
        raw_content = File.read(File.expand_path('~/.catalog.yml'))
        @config = YAML.load(raw_content)
      end

      @config
    rescue Errno::ENOENT
      raise Catalog::Error::ConfigurationMissing
    end
  end
end
