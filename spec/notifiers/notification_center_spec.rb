require 'timecrunch'

describe Timecrunch::Notifiers::NotificationCenter do
  describe "#notify!" do
    it "should send a notify message to terminal notifier" do
      notifier = Timecrunch::Notifiers::NotificationCenter.new
      expect(TerminalNotifier).to receive(:notify).with("Timer is done!")
      notifier.notify!
    end
  end
end
