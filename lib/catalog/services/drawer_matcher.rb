require 'uri'

module Catalog
  class DrawerMatcher
    # Accessors
    attr_reader :drawer

    def initialize(document:)
      @document = document
    end

    def match?
      Catalog::Drawer.all.each do |drawer|
        document_where_froms.each do |url|
          @drawer = drawer if /#{drawer.rule}/.match(url)

          break if @drawer
        end

        break if @drawer
      end

      !@drawer.nil?
    end

  private

    def document_where_froms
      # TODO: Have an helper to execute shell commands. Will
      #       be a lot easier to test.
      @document_where_froms ||= URI.extract(`mdls -name kMDItemWhereFroms #{Shellwords.shellescape(@document.path)}`)
    end
  end
end
