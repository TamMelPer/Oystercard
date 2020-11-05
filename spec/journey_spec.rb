require 'journey'

#touched in/out, entry/exit stations
#a method to calculate either min 1 or penalty 6
describe Journey do

let(:entry_station) { double :entry_station}
let(:exit_station) {double :exit_station}
subject {Journey.new(entry_station)}

  it "initializes with entry station" do
    expect(subject.entry_station).to be entry_station
  end

  it "initializes with exit station as nil" do
    expect(subject.exit_station).to be nil
  end

  it "at the end of the journey, the exit station will be changed" do
    expect{ subject.end(exit_station) }.to change { subject.exit_station }
  end

  it "will charge min_charge 1 when touched in & out" do
    subject.end(exit_station)
    expect(subject.fare).to eq Journey::MIN_CHARGE
  end

  it "will charge penalty 6 if only touched in" do
    expect(subject.fare).to eq Journey::PENALTY
  end

  it "will charge penalty 6 if only touched out" do
    test = Journey.new(nil, exit_station)
    expect(test.fare).to eq Journey::PENALTY
  end

end
