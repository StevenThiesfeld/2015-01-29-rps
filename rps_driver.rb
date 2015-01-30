# The driver method is doing too much -- really, all it should do
# is create two players, tell them to play until they’re done
# (this should be a single method call), and then report the winner.
# Make this happen by way of creating a Game class; the driver method
# creates two players, creates the game, gives the players to the game,
# then tells the game to start. When the game is done, it reports its
# result back to the driver class. The only methods of the Game class
# that your driver should ever see are new and play. It is very likely
# that your Game class will have other methods, but the only methods
# that your driver should ever interact with are new and play.

require 'pry'
require_relative 'rps_game'
require_relative 'rps_player'

# Method: driver
#
# Plays a round of RPS and announces the winner.
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
# Sets player1 and player2 to created Player objects.
# Updates Player.move and Player.score



def driver(name1, name2)
  
  player1 = Player.new(name1)
  player2 = Player.new(name2)
  
  puts "best of:"
  best_of = gets.to_i
  game = Game.new(player1, player2, best_of)
  game.play
  puts "#{game.winner} is the winner!!"
end
  



#driver("New Guy", "RPS Champion Bob Cooper")
  