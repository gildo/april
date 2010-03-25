require 'lib/Base'

class Rube

  #Initializing Rube
  def initialize

    #Parsing the config and then initializing args
    parse_conf

    #Loading modules
    load_modules

  end
end
