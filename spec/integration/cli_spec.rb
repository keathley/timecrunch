require 'timecrunch'

describe "CLI" do
  describe "start command" do
    context "when a start time is provided" do
      it "should wait for that amount of minutes" do
        timer = instance_double("Timer", notifiers: [])
        allow(Timecrunch::Timer).to receive(:new).with(hash_including(minutes: 1)) { timer }
        expect(timer).to receive(:start!)

        Timecrunch::CLI.start(["start", "1"])
      end
    end

    context "the seconds parameter is added" do
      it "should wait for that many seconds" do
        timer = instance_double("Timer", notifiers: [])
        expect(Timecrunch::Timer).to receive(:new).with(hash_including seconds: 3) { timer }
        expect(timer).to receive(:start!)

        Timecrunch::CLI.start(["start", "-s", "3"])
      end
    end

    describe "specifying notifiers" do
      let(:timer) { instance_double("Timer", notifiers: []) }
      let(:console) { double() }
      let(:notifier) { double() }

      before do
        allow(Timecrunch::Notifiers::Console).to receive(:new) { console }
        expect(Timecrunch::Timer).to receive(:new) { timer }
        expect(timer).to receive(:start!)
      end

      context "when the growl command is added" do
        it "should send a console notification and a growl notification" do
          allow(Timecrunch::Notifiers::NotificationCenter).to receive(:new) {
            notifier
          }
          Timecrunch::CLI.start(["start", "--growl"])
          expect(timer.notifiers).to eq [console, notifier]
        end
      end

      context "when the beep command is added" do
        it "should send a console notification and beep" do
          allow(Timecrunch::Notifiers::Beep).to receive(:new) { notifier }
          Timecrunch::CLI.start(["start", "--beep"])
          expect(timer.notifiers).to eq [console, notifier]
        end
      end
    end
  end
end