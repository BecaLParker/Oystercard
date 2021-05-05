# frozen_string_literal: true

require 'station'

describe Station do
  let(:euston) { Station.new('Euston', 1) }

  describe '#zone' do
    it 'show the zone' do
      expect(euston.zone).to eq 1
    end
  end
end
