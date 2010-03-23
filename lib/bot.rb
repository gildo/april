#!/usr/bin/env ruby
require 'socket'
require 'yaml'


module Rube
  class Bot

    attr_accessor :config, :modules, :server, :channel, :port, :nick, :log

    def initialize()
      @config = YAML::load_file("config.yml")
      init_args
      @modules = modules.split
      puts "Loading modules: #{modules}"
      load_modules
      connect
    end

    def init_args
      @config.each do |k,v|
        self.class.send(:define_method, k, proc{v})
      end
    end


    def connect
      @socket = TCPSocket.new(server, @config["port"])
      write "USER #{nick} #{nick} #{nick} :#{nick}"
      write "NICK #{nick}"
      write "JOIN ##{channel}"
      listen
    end

    def listen
      @socket.each do |get|
        Logger::Lager.new.log "RECEIVED: #{get}"
        parse(get)
      end
    end

    def write(msg)
      puts ">> #{msg}"
      @socket.puts "#{msg}\n"
    end

    def load_modules
      @modules.each do |mod|
        require "lib/modules/#{mod}"
      end
    end

  end
end
