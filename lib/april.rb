dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include? dir

require 'yaml'
require 'socket'

require 'april/client'
require 'april/parser'
require 'april/socket'

module APRIL
  VERSION = '0.0.0'
end

