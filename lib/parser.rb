module Rube
  class Bot
    def parse(message)
      puts "<< #{message.to_s.strip}"

      # Handling pings
      if /^PING (.*?)\s$/.match(message)
        response("PONG #{$1}")
      end
    end

  end
end
