module Classify
  module Config
    def self.drawers
      config.drawers
    end

  private

    def self.config
      unless @config
        raw_content = File.read(File.expand_path('~/.classify.yml'))
        yaml_content = YAML.load(raw_content)
        @config = Hashie::Mash.new(yaml_content)
      end

      @config
    rescue Errno::ENOENT
      raise Classify::Error::ConfigurationMissing
    end
  end
end
