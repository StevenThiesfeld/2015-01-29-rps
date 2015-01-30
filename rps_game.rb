# Class: Game
#
# Plays a game of rock paper scissors between two given players.
#
# Attributes:
# @player1   -Player:  the first player of the game
# @player2   -Player:  the second player of the game
# @best_of   -Integer: how many games will be played
# @winner    -String:  the name of the overall winner
# @rules     -Rules:   the rules of rps 
#
# Public Methods:
# #scoreboard
# #end_game
# #play

class Game 
  attr_reader :end_score, :rules
  attr_accessor :winner, :player1, :player2
  
  def initialize(player1, player2, best_of)
    @player1 = player1
    @player2 = player2
    @end_score = (best_of / 2) +1
    @winner = "" 
    @rules = Rules.new  
  end
  
  # Public: #scoreboard
  # Adds a point to the victor of the round and displays score.
  #
  # Parameters:
  # victor - Player: The player that won the round
  #
  # Returns:
  # String: The scores of player1 and player2
  #
  # State Changes:
  # victor.win increments player.score by 1.
  
  def scoreboard(victor)
    victor.win if victor != nil
    puts "#{victor.name} won the round." if victor != nil
    puts "#{player1.name}: #{player1.score}", "#{player2.name}: #{player2.score}"
  end
  
  # Public: end_game
  # Ends the game when a player wins enough rounds.
  #
  # Parameters:
  # player1.score - Integer: The first player's score.
  # player2.score - Integer: The second player's score.
  # best_of       - Integer: The number of points needed to end the game.
  #
  # Returns:
  # String: @winner The name of the player that won.
  #
  # State Changes:
  # Sets @winner to whoever has the most points.
  
  def end_game
    if player1.score == end_score
      @winner = player1.name
      @winner
    elsif player2.score == end_score
      @winner = player2.name
      @winner
    end
  end
  
  # Public: play
  # Plays a full round of rock paper scissors using methods.
  #
  # Parameters:
  # player1  - Player: The first Player.
  # player2  - Player: The first Player.
  #
  # Returns:
  # none
  #
  # State Changes:
  # none
    
  def play
    until end_game == winner 
      player1.rps_move(rules)
      player2.rps_move(rules)
      scoreboard(rules.rps_judge_game(player1, player2))
      end_game
    end
    puts "#{@winner} is the winner!"
  end
      
end #class end