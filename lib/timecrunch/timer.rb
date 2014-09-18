module Timecrunch
  class Timer
    def initialize(minutes, notifier)
      @minutes = minutes
      @notifier = notifier
    end

    def start
      sleep(@minutes * 60)
      @notifier.notify!
    end
  end
end
