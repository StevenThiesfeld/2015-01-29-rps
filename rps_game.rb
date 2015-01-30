# Class: Game
#
# Plays a game of rock paper scissors between two given players.
#
# Attributes:
# @player1   -Player:  the first player of the game
# @player2   -Player:  the second player of the game
# @best_of   -Integer: how many games will be played
# @valid_move-Array:   what moves will be accepted from the players
# @judge     -Hash:    determines which player will win a given round
# @winner    -String:  the name of the overall winner
#
# Public Methods:
# #get_move
# #compare_moves
# #scoreboard
# #end_game
# #play

class Game < Rules
  attr_reader :best_of
  attr_accessor :winner, :player1, :player2
  
  def initialize(player1, player2, best_of)
    @player1 = player1
    @player2 = player2
    @best_of = (best_of / 2) +1
    @winner = ""   
  end
  
  
  # Public: #compare_moves
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
  
  def compare_moves
    if player2.move == judge[player1.move]
      @player1
    elsif player1.move == judge[player2.move]
      @player2
    else puts 'tie'
    end
  end
  
  # Public: #scoreboard
  # Adds a point to the victor of the round.
  #
  # Parameters:
  # victor - Player: The player that won the round
  #
  # Returns:
  # Integer: The scores of player1 and player2
  #
  # State Changes:
  # Increments victor.score by 1.
  
  def scoreboard(victor)
    if victor != nil
      victor.win
      puts "#{victor.name} won the round."
    end
    return player1.score, player2.score
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
  # Sets @winner to whoever won.
  
  def end_game
    if player1.score == best_of
      @winner = player1.name
      @winner
    elsif player2.score == best_of
      @winner = player2.name
      @winner
    end
  end
  
  # Public: play
  # Plays a full round of rock paper scissors using other methods.
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
    loop do
      player1.rps_move
      player2.rps_move
      puts scoreboard(compare_moves)
      end_game
      break if end_game == winner
    end
  end
      
end #class end