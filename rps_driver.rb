require 'pry'
require_relative 'rps_game'
require_relative 'rps_player'
require_relative 'rps_rules'

class Driver
  attr_reader :player1, :player2, :rules, :game
  
  def get_players
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
      
 
  def make_game
    get_players
    pick_game
    puts "best of:"
    best_of = gets.to_i
    @game = Game.new(player1, player2, best_of, rules)
    game.play
  end
  
  # Method: play_game
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

  def play_game
    
    game.play
  end
  
end#classend
  
driver = Driver.new
#driver.get_players
driver.make_game
  