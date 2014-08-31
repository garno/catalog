module Classify
  class DocumentMover
    def initialize(document:, drawer:)
      @document = document
      @drawer = drawer
    end

    def move!
      create_drawer_folder

      FileUtils.mv(@document.path, @drawer.path)
    end

  private

    def create_drawer_folder
      FileUtils.mkdir_p(@drawer.path) unless File.directory?(@drawer.path)
    end
  end
end
