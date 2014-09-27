require "thor"

module Timecrunch
  class CLI < Thor

    desc "start MINUTES", "Starts a new timer for MINUTES"
    option :s, :banner => "seconds"
    option :growl, :type => :boolean, :banner => "notification center"
    option :beep, :type => :boolean, :banner => "beep when timer is done"
    def start(minutes=0)
      seconds = options[:s].nil? ? 0 : options[:s].to_i
      minutes = minutes.to_i
      timer = Timer.new(minutes: minutes, seconds: seconds)
      timer.notifiers << Notifiers::Console.new
      timer.notifiers << Notifiers::NotificationCenter.new if options[:growl]
      timer.notifiers << Notifiers::Beep.new if options[:beep]
      timer.start!
    end
  end
end
