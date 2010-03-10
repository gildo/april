#!/usr/bin/env ruby
require 'socket'
require 'yaml'
require 'lib/utils'
require 'lib/parser'

module Rube
  class Bot
  
    attr_accessor :config
  
    def initialize(opts={})
      @config = YAML::load_file("config.yml")
      connect
    end
  
    def connect
      @socket = TCPSocket.new(@config["server"], @config["port"])
      response "USER #{config["nick"]} #{config["nick"]} #{config["nick"]} :#{config["nick"]}"
      response "NICK #{config["nick"]}"
      response "JOIN ##{config["channel"]}"
      log "User #{config["nick"]} joined channel #{config["channel"]} on server #{config["server"]}"
      listen
    end

    def listen
      @socket.each do |msg|
        log "RECEIVED: #{msg}"
        parse(@socket.gets)
      end
    end

    def response(message)
      puts ">> #{message.strip}"
      @socket.puts(message)
      log "Wrote #{message.chomp} to #{config["server"]}"
    end
      
  end
end
