require 'socket'

class BOT

    def initialize(server, port, nick, channel)
        @server = server
        @port = port
        @nick = nick
        @channel = channel
    end

    def connect()
        # Connect to the IRC server
        @irc = TCPSocket.open(@server, @port)
        say "USER blah blah blah :blah blah"
        say "NICK #{@nick}"
        say "JOIN #{@channel}"
    end

    def say(s)
        puts "--> #{s}"
        @irc.puts "#{s}\n"
    end

    def say_to_chan(msg)
        say "PRIVMSG #{@channel} :#{msg}"
    end

    #DELETE ME!
    def say_to_user(msg)
        @user = user
        say "PRIVMSG #{user} :#{msg}"
    end
    
    def hsi(s)
        case s
            when /^PING :(.+)$/i
                puts "[ Server ping ]"
                say "PONG :#{$1}"
            when /^:(.+?)!(.+?)@(.+?)\sPRIVMSG\s.+\s:[\001]PING (.+)[\001]$/i
                puts "[ CTCP PING from #{$1}!#{$2}@#{$3} ]"
                say "NOTICE #{$1} :\001PING #{$4}\001"
            when /^:(.+?)!(.+?)@(.+?)\sPRIVMSG\s.+\s:[\001]VERSION[\001]$/i
                puts "[ CTCP VERSION from #{$1}!#{$2}@#{$3} ]"
                say "NOTICE #{$1} :\001VERSION fyskij's IRC ruby bot, fuck you\001"
            when /PRIVMSG #(.+?) :rubot/
                puts "#{$5} from #{$1}!#{$2}@#{$3}"
                user = $1
                ye = "ehhhhh? che diavolo vuoi?"
                say_to_chan "PRIVMSG #{user} #{ye}"
        end
    end

    def evaluate(s)
        # Make sure we have a valid expression (for security reasons), and
        # evaluate it if we do, otherwise return an error message
        if s =~ /^[-+*\/\d\s\eE.()]*$/ then
            begin
                s.untaint
                return eval(s).to_s
            rescue Exception => detail
                puts detail.message()
            end
        end
        return "Error"
    end


    def run
        while true
            msg = @irc.gets
            puts msg
            hsi(msg)
        end
    end
end
