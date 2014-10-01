require 'ruby-progressbar'

module Timecrunch
  class Timer
    attr_accessor :notifiers

    def initialize(times, *notifiers)
      @times = times
      @notifiers = notifiers
    end

    def start!
      @formatter = ProgressBar.create(title: "Time", total: total_time)
      tick(total_time) do
        @formatter.increment
      end
      @notifiers.each { |notifier| notifier.notify! }
    end

    private

    def tick(total_times)
      total_times.times do
        sleep(1)
        yield
      end
    end

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
