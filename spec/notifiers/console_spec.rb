require 'timecrunch'

describe Timecrunch::Notifiers::Console do
  describe "#notify!" do
    before do
      $stdout = StringIO.new
    end

    it "should display output" do
      notifier = Timecrunch::Notifiers::Console.new
      notifier.notify!
      expect($stdout.string).to match("Timer is done!")
    end
  end
end