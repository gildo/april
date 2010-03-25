require 'lib/Modules'
require 'lib/Parser'
require 'lib/Irc'
require 'lib/Logger'

class Rube

  include Irc
  include Parser
  include Modules
  include Logger

end

