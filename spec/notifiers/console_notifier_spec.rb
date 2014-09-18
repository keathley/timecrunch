require 'timecrunch'

describe Timecrunch::Notifiers::ConsoleNotifier do
  describe "#notify!" do
    before do
      $stdout = StringIO.new
    end

    it "should display output" do
      notifier = Timecrunch::Notifiers::ConsoleNotifier.new
      notifier.notify!
      expect($stdout.string).to match("Timer is done!")
    end
  end
end