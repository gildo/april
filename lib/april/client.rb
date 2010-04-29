require 'lib/april/client/parser'

class Client
  attr_reader :version, :config

  def initialize ()


    @config = YAML.load_file("april.conf")
    init_args

  end

  def init_args
    @config.each do |k,v|
      self.class.send(:define_method, k, proc{v})
    end
  end

  def connect()
    @socket = TCPSocket.new(config["server"], config["port"])
    write "NICK #{informations[0]["nick"]}"
    write "USER #{informations[1]["user"]} * * :#{informations[2]["realname"]}"
    write "JOIN #cacca"
    listen
  end

  def listen
    until @socket.eof? do
      parse @socket.gets
    end
  end

  def write(msg)
    puts ">> #{msg}"
    @socket.puts "#{msg}\n"
  end

end

