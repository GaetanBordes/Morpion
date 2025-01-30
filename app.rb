require 'bundler/setup'
Bundler.require

require_relative 'lib/player.rb'
require_relative 'lib/board.rb'
require_relative 'lib/game.rb'
require_relative 'lib/board_case.rb'

game = Game.new
game.start 