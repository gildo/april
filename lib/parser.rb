module Rube
  class Bot
    def parse(msg)
      puts "#{msg.to_s}"

      # Handling pings
      if /^PING (\S+)/i.match(msg)
        response("PONG #{$1}")
      end

      if Greetings
        Greetings.greet
      end

      if msg =~ /!quote/
        r = msg.split /!quote=/
        if r != nil
          @w.add(r[1].chop)
        end

      end
      if msg =~ /^:(\S+)\!\S* PRIVMSG ##{config["channel"]} :man/
        response("PRIVMSG ##{config["channel"]} :commands: Nil")
      end

    end
  end
end

