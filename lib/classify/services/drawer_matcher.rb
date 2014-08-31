module Classify
  class DrawerMatcher
    # Accessors
    attr_reader :drawer

    def initialize(document:)
      @document = document
    end

    def match?
      Classify::Drawer.all.each do |drawer|
        document_where_froms.each do |url|
          @drawer = drawer if url =~ /#{drawer.rule}/

          break if @drawer
        end

        break if @drawer
      end

      !@drawer.nil?
    end

  private

    def document_where_froms
      @document_where_froms ||= URI.extract(`mdls -name kMDItemWhereFroms #{Shellwords.shellescape(@document.path)}`)
    end
  end
end
