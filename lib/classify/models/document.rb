module Classify
  class Document
    # Accessors
    attr_accessor :path

    def initialize(path:)
      @path = path
    end
  end
end
