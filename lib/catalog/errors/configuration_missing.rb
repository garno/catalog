module Catalog
  module Error
    class ConfigurationMissing < StandardError
      def to_s
        '~/.catalog.yml is missing'
      end
    end
  end
end
