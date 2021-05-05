# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  let(:station) { double('station') }
  # let(:card_in_journey) { subject.touch_in(station)}
  # allows?

  describe '#balance' do
    it 'a freshly initialised card has a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'adds the top up amount to the balance' do
      subject.top_up(15)
      expect(subject.balance).to eq 15
    end

    it 'raise an error if the topup would take balance beyond £90' do
      expect { subject.top_up(91) }.to raise_error("Exceeds maximum balance limit of #{Oystercard::MAXIMUM_LIMIT}")
    end
  end

  describe '#in_journey?' do
    before do
      subject.top_up(10)
    end

    context 'before journey' do
      it 'returns false' do
        expect(subject).not_to be_in_journey
      end
    end

    context 'during journey' do
      it 'returns true' do
        subject.touch_in(station)
        expect(subject).to be_in_journey
      end
    end

    context 'after journey' do
      it 'returns false' do
        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject).not_to be_in_journey
      end
    end
  end

  describe '#touch_in' do
    context 'balance is below minimum' do
      it 'raises an excpetion' do
        expect { subject.touch_in(station) }.to raise_error 'Balance is below minimum required for journey'
      end
    end

    context 'with a sufficient balance' do
      before do
        subject.top_up(10)
      end

      it 'set the entry station' do
        subject.touch_in(station)
        expect(subject.entry_station).to eq(station)
      end
    end
  end

  describe '#touch_out' do
    before do
      subject.top_up(10)
      subject.touch_in(station)
    end

    it 'reduces balance by the minimum fare' do
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-1)
    end

    it 'sets entry_station to nil' do
      subject.touch_out(station)
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#journeys' do
    context 'when initialised' do
      it 'returns an empty array' do
        expect(subject.journeys).to eq([])
      end
    end

    context 'after one journey' do
      it 'shows previous journeys' do
        station2 = double('station')
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out(station2)
        expect(subject.journeys).to eq([{entry_station: station, exit_station: station2}])
      end
    end
  end
end

