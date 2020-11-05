require 'station'

describe Station do
  let(:name) { double :name}
  let(:zone) { double :zone}
  subject {Station.new(name, zone)}

  it "creates an instance of Station" do
    expect(subject).to be_instance_of Station
  end

  it "initializes with a name" do
    expect(subject.name).to be name
  end

  it "initializes with a zone" do
    expect(subject.zone).to be zone
  end
end
