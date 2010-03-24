require 'fileutils'

module Logger

  # The stupid logger method
  class Lager

    attr_accessor :logging, :channel, :nick

    def log (s)
      #open the log file and write string
      return if logging == true
      if !File.directory?("log")
        FileUtils.mkdir_p('log')
      end
      @loga = File.open("log/#{Time.now.strftime("%d:%m:%Y")}.log","a") do |loga|
        loga.puts Time.now.strftime("[%m/%d/%Y-%H:%M:%S] ") + s
      end
    end
  end
end
