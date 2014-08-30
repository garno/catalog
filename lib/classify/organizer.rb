module Classify
  class Organizer
    def run!
      downloaded_files.each do |file|
        Drawer.all.each do |drawer|
          if file.where_froms.select { |url| url.match(drawer.rule) }.compact
            matching_drawer = drawer
          end

          file.put_in(drawer)
        end
      end
    end

  private

    def downloaded_files
      file_list.map { |path| Classify::Document.new(path) }
    end

    def file_list
      Dir[File.expand_path('~/Downloads/*')].reject { |path| File.directory?(path) }
    end
  end
end
