module Timecrunch
  module Notifiers
    class ConsoleNotifier
      def notify!
        puts "Timer is done!"
      end
    end
  end
end