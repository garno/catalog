module Classify
  class Document
    def initialize(file_path)
      @file = File.open(file_path)
      @file_path = file_path
    end

    def where_froms
      URI.extract(`mdls -name kMDItemWhereFroms #{@file_path}`)
    end

    def put_in(drawer)
      FileUtils.mkdir_p(drawer.path)
      FileUtils.mv(@file_path, drawer.path)
    end
  end
end
