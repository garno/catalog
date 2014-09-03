module Catalog
  class Document
    attr_accessor :path

    def initialize(path:)
      @path = path
    end
  end
end
