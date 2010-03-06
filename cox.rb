#!/usr/bin/env ruby

require 'lib/main'
require 'lib/utils'

class BOT
    VERSION = '0.0.1'
end

bot = BOT.new("irc.azzurra.org", 6667, "rubot", "#0x90")
bot.connect()
bot.run
