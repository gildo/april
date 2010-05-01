module APRIL

  class Client
    attr_reader :version, :modules, :config, :user, :nick, :realname, :channels, :irc


    def initialize(config)
      @version = APRIL::VERSION

      @modules = {}

      @irc = APRIL::Socket.new

      @config = config
      @config.each do |k,v|
        self.class.send(:define_method, k, proc{v})
      end

      @nick = informations[0]["nick"]
      @user = informations[1]["user"]
      @realname = informations[2]["realname"]
      @channels = channels
    end

    def go

      @irc.connect(server, port)

      @irc.user(@user, @realname)
      @irc.nick(@nick)

      @irc.join(@channels)

      @irc.listen
    end

  end
end

