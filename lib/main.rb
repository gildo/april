module Rube

  class Bot

    def load_modules
      modules.each do |mod|
        require "lib/modules/#{mod}"
      end
    end
  end
end
      
    
