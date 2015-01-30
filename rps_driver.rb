require 'pry'
require_relative 'rps_game'
require_relative 'rps_player'
require_relative 'rps_rules'

# Method: driver
#
# Plays a round of RPS.
#
# Parameters:
# name1 - String: Name of player1.
# name2 - String: Name of player2.
#
# Returns:
# String: name of whichever player won the round
#
# State Changes:
# Creates new Player objects, sets Player.name.
# Creates new Game.



def driver(name1, name2)
  
  player1 = Player.new(name1)
  player2 = Player.new(name2)
  
  puts "best of:"
  best_of = gets.to_i
  game = Game.new(player1, player2, best_of)
  game.play
end
  



driver("New Guy", "RPS Champion Bob Cooper")
  