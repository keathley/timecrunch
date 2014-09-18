require "thor"

module Timecrunch
  class CLI < Thor

    desc "start MINUTES", "Starts a new timer for MINUTES"
    def start(minutes)
      Timer.new(minutes.to_i, Notifiers::ConsoleNotifier.new).start!
    end
  end
end
