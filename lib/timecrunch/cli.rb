require "thor"

module Timecrunch
  class CLI < Thor

    desc "start MINUTES", "Starts a new timer for MINUTES"
    option :s, :banner => "seconds"
    def start(minutes)
      seconds = options[:s].to_i if options[:s]
      minutes = minutes.to_i
      times = {
        :minutes => minutes,
        :seconds => seconds,
      }
      Timer.new(times, Notifiers::ConsoleNotifier.new).start!
    end
  end
end
