require 'spec_helper'

RSpec.describe Classify::DrawerMatcher do
  let(:matcher) { Classify::DrawerMatcher.new(document: document) }
  let(:document) { Classify::Document.new(path: '/path/to/document') }

  before { expect(Classify::Drawer).to receive(:all).and_return(drawers) }

  describe :match? do
    let(:drawers) { [Classify::Drawer.new(rule: 'basecamp', path: '/path/to/drawer')] }

    context 'with a matching drawer' do
      specify do
        expect(matcher).to receive(:document_where_froms).and_return(['http://basecamp.com/path/to/document.pdf'])
        expect(matcher.match?).to be_truthy
      end
    end

    context 'with no matching drawer' do
      specify do
        expect(matcher).to receive(:document_where_froms).and_return(['http://pivotaltracker.com/path/to/document.pdf'])
        expect(matcher.match?).to be_falsey
      end
    end

    context 'with two matching drawers' do
      let(:drawers) do
        [
          Classify::Drawer.new(rule: 'basecamp', path: '/path/to/drawer'),
          Classify::Drawer.new(rule: 'base', path: '/path/to/drawer')
        ]
      end

      specify do
        expect(matcher).to receive(:document_where_froms).and_return(['http://basecamp.com/path/to/document.pdf'])
        expect(matcher.match?).to be_truthy

        # For now, classify simply select the first
        # matching drawer. Keep that in mind.
        expect(matcher.drawer).to eq(drawers.first)
      end
    end
  end

  describe :document_where_froms do
    pending
  end
end
