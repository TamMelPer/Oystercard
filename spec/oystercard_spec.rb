require 'oystercard'

describe OysterCard do
  it "created an instance of OysterCard" do
    expect(subject).to be_an_instance_of OysterCard
  end

  it "initialized card has a balance of 0 by default" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    it "allows the user to add money" do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it "raises an error if #top_up exceeded maximum" do
      subject.top_up(OysterCard::MAX_BALANCE)
      expect { subject.top_up(1) }. to raise_error "Maximum balance is £#{OysterCard::MAX_BALANCE}"
    end
  end

  describe "#deduct" do
    it "reduces the oyster card balance" do
      card = OysterCard.new
      card.top_up(10)
      card.deduct(5)
      expect(card.balance).to eq 5
    end
  end
end
