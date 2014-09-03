module Catalog
  class Drawer
    attr_accessor :rule, :path

    def initialize(rule:, path:)
      @rule = rule
      @path = path
    end

    def self.all
      Catalog::Config.drawers.map do |attributes|
        Catalog::Drawer.new(rule: attributes['rule'], path: attributes['path'])
      end
    end
  end
end
