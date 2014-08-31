module Classify
  class Organizer
    def initialize(base_path:)
      @base_path = base_path
    end

    def run!
      new_documents.each do |document|
        matcher = DrawerMatcher.new(document: document)

        if matcher.match?
          DocumentMover.new(document: document, drawer: matcher.drawer).move!
        end
      end
    end

  private

    def new_documents
      unorganized_files.map { |path| Classify::Document.new(path: path) }
    end

    def unorganized_files
      Dir[File.expand_path(@base_path)].reject { |path| File.directory?(path) }
    end
  end
end
