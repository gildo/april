module Greetings
    def day_part
	cur_hour = Time::now.hour
	return :morning if cur_hour >= 5 and cur_hour < 12
	return :afternoon if cur_hour >= 12 and cur_hour < 18
	return :night if cur_hour >= 18 or cur_hour < 5
    end

    def greet(greeting, nick)
	case greeting
	when /[Bb]uongiorno/
	    case day_part
	    when :morning
		"Buongiorno #{nick}!"
	    when :afternoon
		"Buon pomeriggio #{nick}. La mattina è finita, sono le: #{Time::now.strftime("%H:%M")}"
	    when :night
		"Buona notte #{nick}! Giorno?!? svegliati la giornata è finita."
	    end
	when /[Bb]uon [Pp]omeriggio/
	    case day_part
	    when :morning
		"Buongiorno #{nick}! La mattina è finita."
	    when :afternoon
		"Buon pomeriggio #{nick}!"
	    when :night
		"Buona sera #{nick}!, è gia buoi #{Time::now.strftime("%H:%M")}."
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
