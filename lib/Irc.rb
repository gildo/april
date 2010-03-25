#!/usr/bin/env ruby
require 'socket'

module Irc

  def connect
    @socket = TCPSocket.new(server, @config["port"])
    write "USER #{nick} #{nick} #{nick} :#{nick}"
    write "NICK #{nick}"
    write "JOIN #{channel}"
    listen
  end

  def listen
    @socket.each do |get|
      Logger.log "RECEIVED: #{get}"
      Parser.parse_irc(get)
    end
  end

  def write(msg)
    puts ">> #{msg}"
    @socket.puts "#{msg}\n"
  end

end

