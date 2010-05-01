lib = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module APRIL

  class Socket
    include APRIL::PARSER

    attr_reader :server, :port, :socket

    def connect(server, port)
      @server = server
      @port = port

      @socket = TCPSocket.new(@server, @port)
    end

    def write(msg)
      puts ">> #{msg}"
      @socket.write "#{msg}\n"
    end

    def listen
      until @socket.eof? do
        puts "<< #{@socket.gets}"
        self.handle (@socket.gets)
      end
    end

    # Send NICK command
    def nick(nick)
      write("NICK #{nick}")
    end

    # Send USER command
    def user(user, realname)
      write("USER #{user} * * :#{realname}")
    end

    # Send JOIN command
    def join(channels)
      channels.each do |channel|
        write("JOIN ##{channel}")
      end
    end

  end
end

