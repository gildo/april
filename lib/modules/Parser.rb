module Rube
  class Bot
    def parse(msg)
      puts "#{msg.to_s}"

      # Handling pings
      if msg.match(/^PING :(.+)$/i)
        response("PONG :#{$1}")
      end

    end
  end
end
