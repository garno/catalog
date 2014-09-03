require 'spec_helper'

RSpec.describe Catalog::DocumentMover do
  let(:mover) { Catalog::DocumentMover.new(document: document, drawer: drawer) }
  let(:document) { Catalog::Document.new(path: '/path/to/document.pdf') }
  let(:drawer) { Catalog::Drawer.new(path: '/path/to/drawer', rule: nil) }

  describe :move! do
    specify do
      expect(File).to receive(:directory?).with(drawer.path).and_return(true)
      expect(FileUtils).to receive(:mv).with(document.path, drawer.path)

      mover.move!
    end
  end

  describe :create_drawer_folder! do
    specify do
      expect(File).to receive(:directory?).with(drawer.path).and_return(false)
      expect(FileUtils).to receive(:mkdir_p).with(drawer.path)

      mover.send(:create_drawer_folder!)
    end
  end
end
