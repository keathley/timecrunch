require "thor"

module Timecrunch
  class CLI < Thor

    desc "start MINUTES", "Starts a new timer for MINUTES"
    option :s, :banner => "seconds"
    option :growl, :type => :boolean, :banner => "notification center"
    def start(minutes=0)
      seconds = options[:s].to_i if options[:s]
      minutes = minutes.to_i
      times = {
        :minutes => minutes,
        :seconds => seconds,
      }
      timer = Timer.new(times, Notifiers::ConsoleNotifier.new)
      timer.notifiers << Notifiers::NotificationCenter.new if options[:growl]
      timer.start!
    end
  end
end
