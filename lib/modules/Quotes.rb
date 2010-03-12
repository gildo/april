module Quote
  class Write

    def initialize
      @array = Array.new
    end

    def add(quote)
      @array << quote.to_s
    end

    def dump
      quotes = YAML::load(File.new("quotes.yml"))
      rarray = Array.new

      if quotes != nil
        rarray = @array + quotes

      else
        rarray = @array
      end

      File.open("quotes.yml", "w+") do |s|
        obj = YAML::dump( r)
        s.puts(obj)
        s.close
      end
    end
  end

  class Read
    def read
      @f = YAML::load(File.new("quotes.yml"))
      puts "VALUE #{@f}"
      return @f[rand( @f.length - 1) + 1 ]
    end
  end
end
