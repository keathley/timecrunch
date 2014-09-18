require 'timecrunch'

describe Timecrunch::Timer do
  describe "#call" do
    it "should call the notifier" do
      notifier = double()
      timer = Timecrunch::Timer.new(1, notifier)
      expect(timer).to receive(:sleep).with(60)
      expect(notifier).to receive(:notify!)
      timer.start!
    end
  end
end