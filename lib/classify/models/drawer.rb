module Classify
  class Drawer
    attr_accessor :rule, :path

    def initialize(rule:, path:)
      @rule = rule
      @path = path
    end

    def self.all
      Classify::Config.drawers.map { |attributes| self.class.new(attributes) }
    end
  end
end
