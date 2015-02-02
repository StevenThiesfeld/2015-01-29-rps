module Shared_Rules
  # Public: #judge_game
  # Compares the moves of player1 and player2.
  #
  # Parameters:
  # move1 - String: Player 1's move
  # move2 - String: Player 2's move
  #
  # Returns:
  # Integer: 1 for Player 1, 2 for Player 2 or 0 for tie
  #
  # State Changes:
  # Sets winner to indicate who won (or tie).
  
  def judge_game(move1, move2)
    if move1 == move2 
      winner = 0
    elsif rules[move1].include?(move2) ? winner = 1 : winner = 2
    end
    winner
  end
  
end

# Class: RPS_Rules
#
# Outlines the rules of rock paper scissors.
#
# Attributes:
# @rules   - Hash:  a hash of moves and what they beat
#
# Public Methods:
# #judge_game

class RPS_Rules
  
  include Shared_Rules
  attr_reader :rules
  
  def initialize
    @rules = {"rock" => "scissors", "paper" => "rock", "scissors" => "paper"}
  end
  
end#classend

# Class: RPSLS_Rules
#
# Outlines the rules of rock paper scissors lizard spock.
#
# Attributes:
# @rules   - Hash:  a hash of moves that point to an array of what they beat
#
# Public Methods:
# #judge_game


class RPSLS_Rules
  include Shared_Rules
  attr_reader :rules
  
  def initialize
    @rules = {"rock" => ["scissors", "lizard"],
              "paper" => ["rock", "spock"],
              "scissors" => ["lizard", "paper"],
              "lizard" => ["spock", "paper"],
              "spock" => ["rock", "scissors"] 
            }
  end
                    
end#classend
