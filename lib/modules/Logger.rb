require 'fileutils'

module Logger

  # The stupid logger method
  class Lager

    def log (s)
      #open the log file and write string
      return unless @logging == false
      if !File.directory?("log")
        File.makedirs('log')
      end
      @log = File.open("log/#{channel}-#{Time.now.strftime("%d:%m:%Y")}.log","a") do |log|
        log.puts Time.now.strftime("[%m/%d/%Y-%H:%M:%S] ") + s
      end
    end
  end
end
