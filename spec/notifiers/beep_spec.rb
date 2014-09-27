require 'timecrunch'

describe Timecrunch::Notifiers::Beep do
  describe "#notify!" do
    before do
      $stdout = StringIO.new
    end

    it "should display output" do
      notifier = Timecrunch::Notifiers::Beep.new
      notifier.notify!
      expect($stdout.string).to match("\a")
    end
  end
end
