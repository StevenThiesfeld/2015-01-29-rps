require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require_relative 'rps_game'
require_relative 'rps_player'
require_relative 'rps_rules'
require_relative 'rps_tourney'

# Class: Driver
#
# Sets up and runs a game.
#
# Attributes:
# @player_factory - Player_Factory: Spits out player objects
# @player1        - Player: The first player.
# @player2        - Player: The second Player
# @rules          - Rules:  The rules for the selected game
# @game           - Game:   The match between player 1 and player 2.
# @tourney        - Tourney A tournament of multiple games between multiple                    players.
# @players_list   - Array: An array of Players competing in a tournament
#
# Methods:
# #startup
# #make_players
# #make_tourney_players
# #pick_game
# #make_game
# #make_tourney

class Driver
  attr_reader :player1, :player2, :rules, :game, :players_list, :tourney
  
  def initialize
    @player_factory = Player_Factory.new
  end
  
  # Method: #startup
#
#   Leads to either make_game or make_tourney based on user input.
#
#   Parameters:
#   choice - Integer: inputted choice for single game or tourney
#
#   Returns:
#   nil
#
#   State Changes:
#   Sets choice to user's choice.
#
  def startup
    choice = 0
    until choice == 1 || choice == 2
      puts "For Single Game type 1 \nFor Tourney type 2"
      choice = gets.to_i
      if choice == 1
        make_game
      elsif choice == 2
        make_tourney
      else puts "not a valid choice, pick again"
      end
    end
  end
  
  # Method: #make_players
  #
  # Gets 2 players from player_factory.
  #
  # Paramaters:
  # none
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets @player1 and @player2 to to Player objects (or AI_Player objects).
    
  def make_players
    @player1 = @player_factory.make_player(1)
    @player2 = @player_factory.make_player(2)
  end
  
 #  Method: #make_tourney_players
 #
 #  Gets an array of players for use in a Tourney.
 #
 #  Parameters:
 #  num - Integer: The number of players the factory will put in the array.
 #
 #  Returns:
 #  nil
 #
 #  State Changes:
 #  Sets @player_list to the created array.
 # 
  def make_tourney_players
    puts "How many Players?"
    num = gets.to_i
    @players_list = @player_factory.make_players_list(num)
  end
  
  # Method: #pick_game
  #
  # Chooses the game ruleset for the created game/tourney.
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
    
  # Method: #make_game
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
  
  # Method: make_tourney
  #
  # Creates a Tourney object and starts it.
  #
  # Parameters:
  # none
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets tourney to new Tourney object.
  # 
  def make_tourney
    make_tourney_players
    pick_game
    tourney = Tourney.new(players_list, rules)
    tourney.start
  end
    
end#classend

  driver = Driver.new
  binding.pry