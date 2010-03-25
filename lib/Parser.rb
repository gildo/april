require 'yaml'

module Parser

  attr_accessor :config, :server, :channel, :port, :nick

  #Parsing messages from IRC
  def parse_irc(msg)
    puts '<< #{msg.to_s}'

    # Handling pings
    if msg.match(/^PING :(.+)$/i)
      response('PONG :#{$1}')
    end
  end

  def parse_conf()

    #YEAH!
    @config = YAML::load_file('config.yml')
    
    @config.each do |k,v|
      self.class.send(:define_method, k, proc{v})
    end

    @modules = modules.split

  end
end
