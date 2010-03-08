#!/usr/bin/env ruby
require 'socket'
require 'yaml'
require 'lib/utils'

module Rube
  class Bot
  
    attr_accessor :config
  
    def initialize(opts={})
      @config = YAML::load_file("config.yml")
    end
  
    def connect
      @socket = TCPSocket.new(@config["server"], @config["port"])
      write "USER #{config["nick"]} #{config["nick"]} #{config["nick"]} :#{config["nick"]}"
      write "NICK #{config["nick"]}"
      write "JOIN ##{config["channel"]}"
      log "User #{config["nick"]} joined channel #{config["channel"]} on server #{config["server"]}"
      listen
    end

    def write s
      s += "\r\n"
      @socket.puts s
      log "Wrote #{s.chomp} to #{config["server"]}"
    end
  
    def listen
      until @socket.eof? do
        msg = @socket.gets
        log "RECEIVED: #{msg}"
        puts msg
        case msg.strip!
          when /PING :/
            say "PONG :#{$1}"
          when /PRIVMSG #{config["nick"]}/
            handlePrivateMessages msg
#          when /PRIVMSG ##{config["channel"]}/
#            handleChannelMessages msg
        end
      end
      
    end

    def say s
      n = 0
      while(n < s.length)
        write "PRIVMSG ##{config["channel"]} :#{s[n..n+449]}"
        n+=450
        log "<#{config["nick"]} : #{config["channel"]}> #{s}"
        sleep 1
      end
    end
  
    def handlePrivateMessages msg
      case msg
        when /^LOGIN /
          login = msg.split(" ")
          authenticate
      end
    end
      
  end
end
