module Timecrunch
  class Timer
    attr_accessor :notifiers

    def initialize(times, *notifiers)
      @times = times
      @notifiers = notifiers
    end

    def start!
      sleep(total_time)
      @notifiers.each { |notifier| notifier.notify! }
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
