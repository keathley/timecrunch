require "thor"

module Timecrunch
  class CLI < Thor

    desc "start MINUTES", "Starts a new timer for MINUTES"
    option :s, :banner => "seconds"
    option :growl, :type => :boolean, :banner => "notification center"
    def start(minutes=0)
      seconds = options[:s].nil? ? 0 : options[:s].to_i
      minutes = minutes.to_i
      timer = Timer.new(minutes: minutes, seconds: seconds)
      timer.notifiers << Notifiers::Console.new
      timer.notifiers << Notifiers::NotificationCenter.new if options[:growl]
      timer.start!
    end
  end
end
