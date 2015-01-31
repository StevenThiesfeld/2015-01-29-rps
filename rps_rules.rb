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

class RPS_Rules
  attr_reader :judge_game, :judge
  
  def initialize
    #@rps = ["rock", "paper", "scissors"]
    @judge = {"rock" => "scissors", "paper" => "rock", "scissors" => "paper"}
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
  
  def judge_game(player1, player2)
    if player2.move == judge[player1.move]
      player1
    elsif player1.move == judge[player2.move]
      player2
    else puts 'tie'
    end  
  end
  
end#classend

class RPSLS_Rules
  attr_reader :judge
  
  def initialize
    @judge = {"rock" => ["scissors", "lizard"],
              "paper" => ["rock", "spock"],
              "scissors" => ["lizard", "paper"],
              "lizard" => ["spock", "paper"],
              "spock" => ["rock", "scissors"] 
            }
  end
  
  def judge_game(player1, player2)
    if judge[player1.move].include?(player2.move)
      player1
    elsif judge[player2.move].include?(player1.move)
      player2
    else puts 'tie'
    end  
  end
                  
end#classend
