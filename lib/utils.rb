require 'ftools'

module Rube
  class Bot

    def log s
      #open the log file and write string
      return unless config["log"]
      if !File.directory?("../log")
        File.makedirs('../log')
      end
      @log = File.open("../log/rube-#{Time.now.strftime("%m")}.log","a") do |log|
        log.puts Time.now.strftime("[%m/%d/%Y-%H:%M:%S] ") + s
      end
    end

  end
end
