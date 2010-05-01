module APRIL
  module PARSER

    def handle(s)
      match = s.match(/PING\s+(.*)$/)
      if match
        write "PONG #{match[1]}"
      end
    end
  end
end

