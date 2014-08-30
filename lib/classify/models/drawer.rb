module Classify
  class Drawer
    attr_accessor :rule, :path

    def self.all
      YAML.load_file(File.join(File.dirname(__FILE__), '..', '..', '..', '.classify.yml'))['drawers'].map do |m|
        Drawer.new(rule: m['rule'], path: m['path'])
      end
    end

    def initialize(rule:, path:)
      @rule = rule
      @path = path
    end
  end
end
