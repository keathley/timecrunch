require 'terminal-notifier'

module Timecrunch
  module Notifiers
    class NotificationCenter
      def notify!
        TerminalNotifier.notify('Timer is done!')
      end
    end
  end
end