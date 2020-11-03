require 'oystercard'

describe OysterCard do
  it "created an instance of OysterCard" do
    expect(subject).to be_an_instance_of OysterCard
  end

  it "initialized card has a balance of 0 by default" do
    expect(subject.balance).to eq 0
  end

  it "initialized card is not on a journey" do
    expect(subject.journey).to eq false
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
      subject.top_up(10)
      subject.deduct(5)
      expect(subject.balance).to eq 5
    end
  end

  describe "#touch_in" do
    it "responds to #touch_in" do
      expect(subject).to respond_to :touch_in
    end
    it "when touch_in, the journey has started" do
      subject.top_up(OysterCard::MIN_BALANCE)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
    it "checks that there is the min amount needed" do
      subject.top_up(OysterCard::MIN_BALANCE)
      subject.deduct(0.50)
      expect { subject.touch_in }.to raise_error(RuntimeError, "Not enough funds")
    end
  end

  describe "#touch_out" do
    it "responds to #touch_out}" do
      expect(subject).to respond_to :touch_out
    end
    it "when touch_out, the journey will have ended" do
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end
