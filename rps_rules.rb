require 'pry'

# Class: Rules
#
# Outlines the rules of rock paper scissors.
#
# Attributes:
# @rps         - Array: a list of acceptable moves
# @rps_judge   - Hash:  a hash of moves and what they beat
#
# Public Methods:
# #rps_judge_game

class Rules
  attr_reader :rps, :rps_judge_game
  
  def initialize
    @rps = ["rock", "paper", "scissors"]
    @rps_judge = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
  end

  # Public: #rps_judge_game
  # Compares the moves of player1 and player2.
  #
  # Parameters:
  # player1.move - String: Player 1's move
  # player2.move - String: Player 2's move
  #
  # Returns:
  # Player: Whoever won, or nil if a tie
  #
  # State Changes:
  # none
  
  def rps_judge_game(player1, player2)
    if player2.move == rps_judge[player1.move]
      player1
    elsif player1.move == rps_judge[player2.move]
      player2
    else puts 'tie'
    end  
  end
  
end#classend