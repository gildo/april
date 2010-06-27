module APRIL
  def pong
      write "PONG #{match[1]}"
  end

  def handle(match)
    if match = /PING\s+(.*)$/
      pong
    elsif match = /^(.*)@#{nick}(.*)$/
    	cicle_user(msg)
    end
  end

  def cicle_usr(msg)
  	@users.each { |user|
		 
  end

  def cicle_user(msg)
  	t1 = Thread.new(cicle_usr(msg))
  end
  
  def cicle_commands(msg)
  
  end
  
  def retrieve_users()
  	write "NAMES @#{channel}"
  end
end