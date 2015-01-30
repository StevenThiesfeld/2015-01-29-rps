require 'pry'
# Class: Player
# Someone playing a rousing game of RPS
#
# Attributes:
# @name     -String:  The name of the Player
# @score    -Integer: The player's score in the current set.
# @move     -String:  The move the player is making in the current game.
#
# Methods:
# #win
# #rps_move

class Player 
  attr_reader :name, :score
  attr_accessor :move

  def initialize(name)
    @name = name
    @score = 0
  end
  
  # Public: #win
  # Adds 1 point to player's score.
  #
  # Parameters:
  # none
  #
  # Returns:
  # none
  #
  # State Changes:
  # @score Integer increased by 1
  
  def win
    @score += 1
  end
  
  # Public: #rps_move
  # Prompts the player for a move and will check if it's valid based on rules from Game.
  #
  # Parameters:
  # rules  -Array: a list of accepted possible moves
  #
  # Returns:
  # none
  #
  # State Changes:
  # Sets @move to String: the player's move.

  def rps_move(rules)
    @move = ""
    until (rules.rps).include?(@move) 
      puts "#{@name}: rock paper or scissors"
      @move = gets.chomp
    puts "not a valid move" if (rules.rps).include?(@move) == false
    end
  end
  
end