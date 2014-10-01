require 'timecrunch'

describe Timecrunch::Timer do
  describe "#call" do
    it "should call all notifiers" do
      notifiers = [double(), double()]
      timer = Timecrunch::Timer.new({minutes: 1}, notifiers)
      timer.notifiers << double()
      expect(timer).to receive(:sleep).exactly(60).times.with(1)
      timer.notifiers.each do |notifier|
        expect(notifier).to receive(:notify!)
      end
      timer.start!
    end

    it "should add second to the time if specified" do
      notifier = double()
      timer = Timecrunch::Timer.new({seconds: 5}, notifier)
      expect(timer).to receive(:sleep).exactly(5).times.with(1)
      expect(notifier).to receive(:notify!)
      timer.start!
    end
  end
end