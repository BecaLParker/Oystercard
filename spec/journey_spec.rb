require 'journey'

describe Journey do
  let(:station) { double :station, zone: 1 }

  it 'knows if the journey is incomplete' do
    expect(subject).not_to be_complete
  end
end
