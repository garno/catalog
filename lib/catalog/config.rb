module Catalog
  module Config
    def self.drawers
      config['drawers']
    end

    def self.config_path(path = nil)
      if path
        @config_path
      else
        @config_path = path
      end

      File.expand_path(@config_path || '~/.catalog.yml')
    end

  private

    def self.config
      unless @config
        raw_content = File.read(config_path)
        @config = YAML.load(raw_content)
      end

      @config
    rescue Errno::ENOENT
      raise Catalog::Error::ConfigurationMissing
    end
  end
end
