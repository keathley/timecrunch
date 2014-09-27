module Timecrunch
  module Notifiers
    class Beep
      def notify!
        print "\a"
      end
    end
  end
end
