module Timecrunch
  module Notifiers
    class Console
      def notify!
        puts "Timer is done!"
      end
    end
  end
end