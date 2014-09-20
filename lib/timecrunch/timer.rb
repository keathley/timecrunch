module Timecrunch
  class Timer
    def initialize(times, notifier)
      @times =times
      @notifier = notifier
    end

    def start!
      sleep(total_time)
      @notifier.notify!
    end

    private

    def total_time
      minutes + seconds
    end

    def minutes
      @times.fetch(:minutes) { 0 } * 60
    end

    def seconds
      @times.fetch(:seconds) { 0 }
    end
  end
end
