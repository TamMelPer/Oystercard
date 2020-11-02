require 'oystercard'

describe OysterCard do
  it "created an instance of OysterCard" do
    expect(subject).to be_an_instance_of OysterCard
  end

  it "initialized card has a balance of 0 by default" do
    expect(subject.balance).to eq 0
  end

end
