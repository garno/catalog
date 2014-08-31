module Classify
  module Error
    class ConfigurationMissing < StandardError
      def to_s
        '~/.classify is missing'
      end
    end
  end
end
