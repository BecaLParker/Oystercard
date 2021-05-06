# frozen_string_literal: true

require 'station'

describe Station do
  let(:euston) { Station.new('Euston', 1) }

  describe '#zone' do
    it 'shows the zone' do
      expect(euston.zone).to eq 1
    end
  end

  describe '#name' do
    it 'shows the name' do
      expect(euston.name).to eq 'Euston'
    end
  end
end
