module Modules

  attr_accessor :modules

 puts "Loading modules: #{@modules}"

  def load_modules
    @modules.each do |mod|
      require "lib/modules/#{mod}"
    end
  end
end

