module Greetings

  def self.greet

  end
  def day_part
    cur_hour = Time::now.hour
    return :morning if cur_hour >= 5 and cur_hour < 12
    return :afternoon if cur_hour >= 12 and cur_hour < 18
    return :night if cur_hour >= 18 or cur_hour < 5
  end

  def greet(greeting, nick)
    case @get
    when /^:(\S+)\!\S* PRIVMSG ##{config["channel"]} :[Bb]uongiorno/
      case day_part
      when :morning
        "Buongiorno #{nick}!"

      when :afternoon
        "Buon pomeriggio #{nick}."

      when :night
        "Buona notte #{nick}! Giorno?!?."
      end


    when /[Bb]uon [Pp]omeriggio/
      case day_part
      when :morning
        "Buongiorno #{nick}!"

      when :afternoon
        "Buon pomeriggio #{nick}!"

      when :night
        "Buona sera #{nick}!"
      end


    when /[Bb]uona [Nn]otte/
      case day_part
      when :morning
        "Buon giorno #{nick}!."

      when :afternoon
        "Buon pomeriggio #{nick}!"

      when :night
        "Buona notte, #{nick}!"
      end

    end
  end
end

