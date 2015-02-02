require 'pry'
require_relative 'rps_game'
require_relative 'rps_player'
require_relative 'rps_rules'

# Class: Driver
#
# Sets up and runs initiates a game.
#
# Attributes:
# @player1   - Player: The first player.
# @player2   - Player: The second Player
# @rules     - Rules:  The rules for the selected game
# @game      - Game:   The match between player 1 and player 2.
#
# Public Methods:
# #get_players
# #pick_game
# #make_game

class Driver
  attr_reader :player1, :player2, :rules, :game
  
  # Method: #make_players
  #
  # Creates the Players that will play the game.
  #
  # Paramaters:
  # choice   - Integer: determines if the 2nd Player will be human or AI.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets @player1 and @player to to Player objects (or AI_Player objects).
  
  def make_players
    puts "Enter your name"
    @player1 = Player.new(gets.chomp)
    choice = 0
    until choice == 1 || choice == 2
      puts "For Human Opponent type 1 \nFor Computer Opponent type 2"
      choice = gets.to_i
      if choice == 1
        puts "Enter your name"
        @player2 = Player.new(gets.chomp) 
      elsif choice == 2
        @player2 = AI_Player.new
      else puts "not a valid choice, pick again"
      end
    end
  end
  
  # Method: #pick_game
  #
  # Chooses the game ruleset for the created game.
  #
  # Parameters:
  #
  # choice  - Integer: the selection of game.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets @rules to the chosen Rules object.
  
  def pick_game
    choice = 0
    until choice == 1 || choice == 2
      puts "type 1 for Rock Paper Scissors \ntype 2 for Rock Paper Scissors Lizard Spock"
      choice = gets.to_i
      if choice == 1
        @rules = RPS_Rules.new 
      elsif choice == 2
        @rules = RPSLS_Rules.new
      else puts "not a valid choice, pick again"
      end
    end
  end
    
  # Method: make_game
  #
  # Plays a match of RPS.
  #
  # Parameters:
  # best_of  - Integer: The number of games being played
  # 
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets Integer value for best_of
  # Sets game to new Game.  
 
  def make_game
    make_players
    pick_game
    puts "best of:"
    best_of = gets.to_i
    @game = Game.new(player1, player2, best_of, rules)
    game.play
  end
  
end#classend

# driver = Driver.new
# driver.make_game